\name{summary.mreg}
\alias{summary.mreg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Prints a summary of an mreg object}
\description{
Similar to \code{\link{summary.glm}}, it prints the coefficients,
standard erros, Wald tests, residuals (if available) and dispersion from
an \code{\link{mreg}} object.}

\usage{
\method{summary}{mreg}(object, digits = max(3, getOption("digits") - 3), 
symbolic.cor = object$symbolic.cor, 
signif.stars = getOption("show.signif.stars"), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{ An \code{\link{mreg}} object }
  \item{digits}{  number of digits to print decimals to. }
  \item{symbolic.cor}{ see \code{\link{summary.lm}} }
  \item{signif.stars}{ Whether or not to print the star coding of
    statistical significance }
  \item{\dots}{ further argument }
}


\author{ Simon Bond, \email{simon.bond@mrc-bsu.cam.ac.uk} }
\seealso{ \code{\link{mreg}}, \code{\link{print.mreg}} }

\keyword{print}% at least one, from doc/KEYWORDS
