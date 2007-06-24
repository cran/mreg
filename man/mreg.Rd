\name{mreg}
\alias{mreg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{To perform regression when discrete outcome variables are missing }
\description{
This software was created for the paper referred to below. If a
longitudinal data base has regularly updated explanatory variables, but
whose outcome variable is only intermittently collected then we can
still perform exact maximum likelihood estimation of a regression model
if the outcome variable is discrete. 
}
\usage{
mreg(formula, data, patid, start.theta = NULL, modify = unity, modify.p = 0,
 mod.formula = ~1, density.name = negbin, link = log, 
iterlim = 100, gradtol = 1e-06, steptol = 1e-06, na.action = NULL, 
print.level = 2, zero.start = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{ This is a formula object e.g.  Y~A+B to describe the
    location parameter }
  \item{data}{ This is a dataframe in which the variables are recorded}
  \item{patid}{In a longitudinal context this indexes the
    individuals. Note that the observations within each
    patient is assumed to be ordered according the timing of the observations.  }
  \item{start.theta}{ Optional vector of starting values for location
    and nuisance parameters}
  \item{modify}{ We may wish to let the location depend on functions of
    the previous outcomes. Since these may be missing, we have to
    provide a function that can cope with all the potential values the
    outcome may have taken. See \code{\link{paper}} and
    \code{\link{unity}} for examples .}
  \item{modify.p}{ This is the dimension of the parameters associated
    with the modify function.}
  \item{mod.formula}{ If we require other variables to interact with the
  previous observation we must create a set of variables to use. This is
a one-sided formula e.g. ~X+Z, if we wanted to use those variables. }
  \item{density.name}{This is the density the increment in outcome is
    assumed to follow. It can be one of three values: negbin, poisson, geometric. }
  \item{link}{This is the link function \eqn{g(\mu)=\eta}{g(mu)=eta}. Where \eqn{\eta}{eta} is a linear
  combination of covariates, and \eqn{\mu}{mu} is the expected value of the
  outcome. The link function can be one of four values: identity, log,
  logit, hyper. } 
  \item{iterlim}{ The maximum number of iterations allowed for the
    \code{\link{nlm}} function. }
  \item{gradtol}{ The parameter \code{gradtol} for the \code{\link{nlm}}
    function.  }
  \item{steptol}{ The parameter  \code{steptol} for the \code{\link{nlm}} function }
  \item{na.action}{Parameter is not used: If any covariates are missing
    the function will return an error.}
  \item{print.level}{ The parameter \code{print.level} for the
    \code{\link{nlm}} function. Set to the maximum, verbose level. }
  \item{zero.start}{It may be the case that it is known that the first
    value of the outcome was zero for all individuals, in which case
    invoke this TRUE/FALSE option. }
}

\value{
It returns an object of class \code{\link{mreg}} which is similar
to a \code{\link{lm}} object. It has \code{\link{print}} and
\code{\link{summary}} methods to display the fitted parameters and standard errors.
}
\references{ Bond S, Farewell V, 2006, Exact Likelihood Estimation for a
  Negative Binomial Regression Model with Missing Outcomes, Biometrics, Submitted}
\author{Simon Bond \email{simon.bond@mrc-bsu.cam.ac.uk} }

\seealso{ \code{\link{print.mreg}}, \code{\link{summary.mreg}},
  \code{\link{paper}}, \code{\link{unity}} }
\examples{
	data(public)
T<-TRUE; F<-FALSE
\dontrun{

mod1 <- mreg( damaged~offset(log(intervisit.time))+esr.init, 
data=public,patid=ptno,print.level=2, iterlim=1000 )


mod.ncar <-mreg(damaged ~ offset(log(intervisit.time)) + esr.init + 
    tender + effused + clinic.time, data = public, patid = ptno, 
    modify = paper, modify.p = 5, mod.formula = ~art.dur.init, 
    density.name = "negbin.ncar", iterlim = 1000, print.level = 2)


}
  }

\keyword{regression}% at least one, from doc/KEYWORDS
\keyword{models}% __ONLY ONE__ keyword per line
