\name{unity}
\alias{unity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{The default value of 'modify' function in 'mreg' }
\description{
If the location term in a regression model does not depend on any
previously observed values of the outcome in a longitudinal data set,
then we obtain simplication in our estimation procedure when the
outcomes can be missing. Using the default value of \code{unity} for the
argument \code{modify} in the \code{\link{mreg}} function does this.
}
\usage{
unity(x, y, mod.Z)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{is a vector of possible values the previous value of the
    reponse could take. }
  \item{y}{ is an vector of the coefficients. Its lenght is specified in
    the \code{\link{mreg}} function by the argument \code{modify.p}.

    For this function, \code{unity}, it is not used and \code{modify.p}=1. }
  \item{mod.Z}{vector of observed covariates that may interact with the
    unobserved preceding outcome corresponding to the observation. It is
  taken from the \code{mode.frame} produced by the \code{mod.formula}
  argument in \code{\link{mreg}}.
  
  For this function \code{unity} there are no such covariates. A default
  value for \code{mod.formula} is \code{~1}.
}
}
\details{
This function  is the default value for the argument \code{modify}  for
\code{\link{mreg}}. It does nothing to the linear predictor term.
}
\value{
 A vector of zeroes the same length is the argument \code{x}.
}
\references{ Bond S, Farewell V, 2006, Exact Likelihood Estimation for a
  Negative Binomial Regression Model with Missing Outcomes }
\author{Simon Bond \email{simon.bond@mrc-bsu.cam.ac.uk}  }
\seealso{ \code{\link{paper}}, \code{\link{mreg}}}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(x,y,mod.Z){

 structure( rep(0,length(x)), par.names=NULL, par.dim=0    )
  }
}
\keyword{regression}% at least one, from doc/KEYWORDS
\keyword{programming}% __ONLY ONE__ keyword per line
