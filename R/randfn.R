#' wrapper to generate random samples from a density function given by a character string as an argument
#'
#' @param n the number of samples to generate
#' @param family the name of the density function, character string
#' @param ... other named arguments to feed into the density function
#' @returns the vector of samples
#' @keywords internal
#' @importFrom stats rnbinom rpois rgeom rbinom



randfn <-function(n, family, ...){
  args <- list(...)
  switch(family,
negbin= rnbinom(n, size=exp(args$size), mu=args$mu),
poisson=rpois(n, lambda=args$mu),
geometric=rgeom(n, prob= args$mu),
binom=rbinom(n, size=args$size, prob=args$mu)

         )
}

