\name{print.mreg}
\alias{print.mreg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Prints the coefficients from an mreg object }
\description{
Similar to \code{print.lm}, it prints the coefficients from an \code{\link{mreg}} regression
model
}
\usage{
\method{print}{mreg}(x, digits = max(3, getOption("digits") - 3), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ An \code{\link{mreg}} object}
  \item{digits}{ number of digits to print decimals to.}
  \item{\dots}{further arguments to the function \code{print.lm}}
}



\author{  Simon Bond, \email{simon.bond@mrc-bsu.cam.ac.uk} }
\seealso{ \code{\link{mreg}}, \code{\link{summary.mreg}}}

\keyword{print}% at least one, from doc/KEYWORDS

