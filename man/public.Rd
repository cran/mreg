\name{public}
\alias{public}
\docType{data}
\title{Subset of Arthritis Data}
\description{
This is a subset of 100 patients and variables from the clinical data
used in the paper below.
\emph{Not to be used in publications without
permission of the authors.}
}
\usage{data(public)}
\format{
  A data frame with 943 observations on the following 8 variables.
  \describe{
    \item{\code{damaged}}{The number of radiologically damaged joints}
    \item{\code{intervisit.time}}{Time between clinic visits}
    \item{\code{esr.init}}{The first ESR measurment}
    \item{\code{art.dur.init}}{The duration of arthritis at first
      clinic visit}
    \item{\code{tender}}{Count of the number of tender joints}
    \item{\code{effused}}{Count of the number of effused joints}
    \item{\code{ptno}}{Anonymous patient number}
    \item{\code{clinic.time}}{Total time spend under clinical care}
  }
}
\author{ Vern Farewell, \email{vern.farewell@mrc-bsu.cam.ac.uk};
  
  Simon Bond, \email{simon.bond@mrc-bsu.cam.ac.uk} }
 

\source{Bond S, Farewell V, 2006, Exact Likelihood Estimation for a
  Negative Binomial Regression Model with Missing Outcomes
  
}


\examples{
data(public)
## maybe str(public) ; plot(public) ...
}
\keyword{datasets}
