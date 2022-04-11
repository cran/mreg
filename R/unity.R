#' The default value of 'modify' function in 'mreg'
#'
#' @description If the location term in a regression model does not depend on any
#' previously observed values of the outcome in a longitudinal data set,
#' then we obtain simplification in our estimation procedure when the
#' outcomes can be missing. Using the default value of \code{unity} for the
#' argument \code{modify} in the \code{\link{mreg}} function does this.
#'
#' @inheritParams paper
#'
#' @details This function  is the default value for the argument \code{modify}  for
#' \code{\link{mreg}}. It does nothing to the linear predictor term.
#'     For this function \code{unity} there are no such covariates.
#'     A default value for \code{mod.formula} is \code{~1}.
#'
#' @returns  A vector of zeroes the same length is the argument \code{x}.
#'
#' @export
#' @keywords regression programming
#'


"unity" <-
function(x,y,mod.Z){

 structure( rep(0,length(x)), par.names=NULL, par.dim=0    )
}

