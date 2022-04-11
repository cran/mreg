
#' wrapper to evaluate a density function given by a character string as an argument
#'
#' @param x the element of the sample space at which to evaluate the density
#' @param family the name of the density function, character string
#' @param ... other named arguments to feed into the density function
#' @returns the value of the density
#' @keywords internal
#' @importFrom stats dnbinom dpois dgeom

densityfn <-function(x, family, ...){

args <- list(...)

switch( family,
"negbin"=  dnbinom(x,size=exp(args$size), mu=args$mu) ,
"negbin.ncar"= dnbinom(x, size=exp(args$size[1]), mu=args$mu)
       *exp( (length(x)>1)*(args$size[2]+x* args$size[3]  ))  /(1+exp( args$size[2]+ x*args$size[3])),
"poisson"= dpois(x, lambda=args$mu),
"geometric"=dgeom(x, prob= args$mu),
#"binom"=dbinom(x, size=args$size, prob=args$mu)
)


}

