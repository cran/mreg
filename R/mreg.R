#' To perform regression when discrete outcome variables are missing
#'
#' @description This software was created for the paper referred to
#' below. If a longitudinal data base has regularly updated explanatory
#' variables, but whose outcome variable is only intermittently
#' collected then we can still perform exact maximum likelihood
#' estimation of a regression model if the outcome variable is discrete.
#'
#' @param formula This is a formula object e.g.  Y~A+B to describe the
#' location parameter
#' @param data This is a data frame in which the variables are recorded
#' @param patid In a longitudinal context this indexes the individuals.
#'  Note that the observations within each patient is assumed to be ordered
#'  according the timing of the observations.
#' @param start.theta Optional vector of starting values for location
#' and nuisance parameters
#' @param modify We may wish to let the location depend on functions of
#' the previous outcomes. Since these may be missing, we have to
#' provide a function that can cope with all the potential values the
#' outcome may have taken. See \code{\link{paper}}
#' @param modify.p This is the dimension of the parameters associated
#' with the modify function.
#' @param mod.formula If we require other variables to interact with the
#' previous observation we must create a set of variables to use. This is
#' a one-sided formula e.g. ~X+Z, if we wanted to use those variables.
#' @param density.name This is the density the increment in outcome is
#' assumed to follow. It can be one of three values: negbin, poisson, geometric.
#' @param link This is the link function \eqn{g(\mu)=\eta}{g(mu)=eta}. Where \eqn{\eta}{eta} is a linear
#' combination of covariates, and \eqn{\mu}{mu} is the expected value of the
#' outcome. The link function can be one of four values: identity, log,
#' logit, hyper.
#' @param iterlim The maximum number of iterations allowed for the
#' \code{\link{nlm}} function.
#' @param gradtol The parameter \code{gradtol} for the \code{\link{nlm}}
#' function.
#' @param steptol The parameter  \code{steptol} for the \code{\link{nlm}} function
#' @param na.action Parameter is not used: If any covariates are missing
#' the function will return an error.
#' @param print.level The parameter \code{print.level} for the
#' \code{\link{nlm}} function. Set to the maximum, verbose level.
#' @param zero.start It may be the case that it is known that the first
#' value of the outcome was zero for all individuals, in which case
#' invoke this TRUE/FALSE option.
#'
#' @return It returns an object of class \code{\link{mreg}} which is similar
#' to a \code{\link{lm}} object. It has \code{\link{print}} and
#' \code{\link{summary}} methods to display the fitted parameters and standard errors.
#'
#' @seealso \code{\link{print.mreg}}, \code{\link{summary.mreg}},
#' \code{\link{paper}}, \code{\link{unity}}
#'
#' @references Bond S, Farewell V, 2006, Exact Likelihood Estimation for a
#' Negative Binomial Regression Model with Missing Outcomes, Biometrics
#'
#' @examples
#' 	data(public)
#'\dontrun{
#' mod1 <- mreg( damaged~offset(log(intervisit.time))+esr.init,
#' data=public,patid=ptno,print.level=2, iterlim=1000 )
#'mod.ncar <-mreg(damaged ~ offset(log(intervisit.time)) + esr.init +
#'          tender + effused + clinic.time, data = public, patid = ptno,
#'          modify = paper, modify.p = 5, mod.formula = ~art.dur.init,
#'        density.name = "negbin.ncar", iterlim = 1000, print.level = 2)
#' }
#' @keywords regression models
#' @importFrom stats model.frame model.matrix model.offset model.response nlm
#' @export


mreg <-
function(formula, data, patid, start.theta=NULL, modify=unity, modify.p=0,
         mod.formula=~1, density.name="negbin",link="log", iterlim=100,
         gradtol=1e-6,steptol=1e-6, na.action=NULL,print.level=2,
         zero.start=FALSE){
	cl<-match.call()
joint.formula <- form.add(substitute(formula), substitute(mod.formula))
        mf <- model.frame( joint.formula, data=data, na.action=na.action)
        Y <- model.response(mf)
        Z <- model.matrix(formula,data=mf)
        mod.Z <- model.matrix(mod.formula, data=mf)

        off <- model.offset(mf)
        if(is.null(off)){ off <- rep(0, length(Y))}
        pat <- data[,deparse(substitute(patid)),drop=TRUE]
        p <- dim(Z)[2]
        nuisance.p <- family.dim(density.name)
        density.name <- as.character(substitute(density.name))
        if( !is.null( start.theta)){
          if( length(start.theta)!= p+nuisance.p+modify.p){
            stop("incorrect length of starting parameters")
          }
        }

        link <- as.character(substitute(link))
        modify <- as.character(substitute(modify))
        if( is.null(start.theta)){
          start.theta <- rep(0,nuisance.p+p+modify.p)
        }
          answer <- nlm(minimand, start.theta, hessian=TRUE, Y=Y,Z=Z,off=off, pat=pat, print.level=print.level, nuisance.p=nuisance.p, iterlim=iterlim,gradtol=gradtol,steptol=steptol, modify=modify,density.name=density.name,link=link, mod.Z=mod.Z,zero.start=zero.start)

        answer$contrasts<-attr(Z,"contrasts")
        coef.index <- (nuisance.p+1):(nuisance.p+p+modify.p)
	dn<-c(colnames(Z),
              attributes(eval(call(modify, x=0, y=rep(0, modify.p),mod.Z=mod.Z[1,] )))$par.names)
	answer$coefficients<-answer$estimate[coef.index]
	names(answer$coefficients)<-dn
	answer$se<-sqrt( diag( solve(answer$hessian)))[coef.index]
	names(answer$se)<-dn
	answer$deviance<-2*answer$minimum
	answer$call<-cl
	answer$model<-mf
        answer$Z <- Z
        answer$offset<-off
        if( modify=="unity"){
          answer$linear.predictors<-Z%*%answer$coefficients[1:p]+off
          answer$fitted.values<-linkfn(answer$linear.predictors, link)
          answer$residuals<-Y-answer$fitted.values
        }
	answer$formula<-formula
	answer$y<-Y
	answer$density.name <- density.name
	answer$link <- link
        answer$modify <- modify
        if( nuisance.p>0){
        answer$nuisance<-list( estimate=answer$estimate[1:nuisance.p],
                                  se=sqrt( diag( solve(answer$hessian)))[1:nuisance.p])
        }
	class(answer)<-c("mreg","lm")
	answer

}

