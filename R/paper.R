#' An example of a function to calculate the effect on the location that depends on previous outcome in an mreg model
#'
#'
#' @description In a regression model one may want to let the linear predictor depend on
#' previous values of the outcome variable in longitudinal data. When the outcome variable is missing we can still do this but we have to create a
#' function that calculates a vector of linear predictors with one element
#' for each of the possible preceding values of the outcome.
#'
#' @param x is a vector of possible values the previous value of the
#' response could take.
#' @param y is an vector of the coefficients. Its length is specified in
#' the \code{\link{mreg}} function by the argument \code{modify.p}.
#' @param mod.Z vector of observed covariates that may interact with the
#' unobserved preceding outcome corresponding to the observation. It is
#' taken from the \code{\link{model.frame}} produced by the \code{mod.formula}
#' argument in \code{\link{mreg}}.
#'
#' @details This is an example function that was used in the paper referred to
#' below. The user may write their own function as long as it takes the
#' arguments specified above and returns a vector the same length as
#' \code{x} that will be added to the linear predictor. It is up to the user to ensure that
#' their function  identifies the correct column of \code{mod.Z} using indices
#' (\code{[]} that correspond to the desired variables in  \code{mod.formula}.
#'     If any function other than \code{\link{unity}} (which does nothing to
#' the linear predictor) is used then it is not possible to produce fitted
#' values or residuals.
#'
#' @returns   A numeric vector the same length as
#' \code{x} that will be added to the linear predictor.
#'     It also has two subsidiary attributes: \code{par.names} names to be
#' used to label the associated coefficients, and \code{par.dim} the
#' length of this vector of coefficients.
#' @seealso \code{\link{unity}} \code{\link{mreg}}
#' @examples
#' ## The function is currently defined as
#' function(x,y, mod.Z){
#'   #x is the imputed response
#'   #y is the set of parameters
#'  #mod.Z is a VECTOR/matrix of explanatory variables
#'  rad.type <- cut(x, breaks=c(-1,0,4,9,50))
#'  if( is.vector(mod.Z)){
#'    arthdur.first <- rep(mod.Z[2],length(x))
#'  }
#'  else{
#'    arthdur.first <- rep(mod.Z[1,2], length(x))
#'  }
#'  X <- model.matrix( ~rad.type+I(x==0):arthdur.first)
#'  structure( X[,-1, drop=FALSE]%*%y, par.names= colnames( X)[-1],par.dim=dim(X)[2]-1)
#' }
#' @export
#' @keywords regression programming



"paper" <-
function(x,y, mod.Z){
  #x is the imputed response
  #y is the set of parameters
  #mod.Z is a VECTOR/matrix of explanatory variables
  damage.cat <- cut(x, breaks=c(-1,0,4,9,50))
  if( is.vector(mod.Z)){
    art.dur.init <- rep(mod.Z[2],length(x))
  }
  else{
    art.dur.init <- rep(mod.Z[1,2], length(x))
  }
  X <- model.matrix( ~damage.cat+I(x==0):art.dur.init)
  structure( X[,-1, drop=FALSE]%*%y, par.names= colnames( X)[-1],par.dim=dim(X)[2]-1)
}

