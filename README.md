
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mreg

<!-- badges: start -->

[![R-CMD-check](https://github.com/shug0131/mreg/workflows/R-CMD-check/badge.svg)](https://github.com/shug0131/mreg/actions)
[![Codecov
eudract_pkg](https://codecov.io/gh/shug0131/mreg/branch/master/graph/badge.svg)](https://app.codecov.io/gh/shug0131/mreg?branch=master)

<!-- badges: end -->

The goal of mreg is to implements the techniques of exact likelihood
when the discrete outcome can be missing in a regression model. It is
the accompanying software to the paper Bond S, Farewell V, 2006, Exact
Likelihood Estimation for a Negative Binomial Regression Model with
Missing Outcomes, Biometrics

## Installation

You can install the released version of mreg from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("mreg")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("shug0131/mreg")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mreg)
 mod1 <- mreg( damaged~offset(log(intervisit.time))+esr.init,
 data=public,patid=ptno,print.level=1, iterlim=1000 )
#> iteration = 0
#> Step:
#> [1] 0 0 0
#> Parameter:
#> [1] 0 0 0
#> Function Value
#> [1] 3902.458
#> Gradient:
#> [1]  3066.5542   690.1451 22153.0783
#> 
#> iteration = 34
#> Parameter:
#> [1] -0.981767860 -6.696169800  0.005720807
#> Function Value
#> [1] 555.7446
#> Gradient:
#> [1] -4.469371e-05 -2.064622e-05 -2.745820e-03
#> 
#> Last global step failed to locate a point lower than x.
#> Either x is an approximate local minimum of the function,
#> the function is too non-linear for this algorithm,
#> or steptol is too large.
 mod1
#> 
#> Call:
#> mreg(formula = damaged ~ offset(log(intervisit.time)) + esr.init,     data = public, patid = ptno, iterlim = 1000, print.level = 1)
#> 
#> Coefficients:
#> (Intercept)     esr.init  
#>   -6.696170     0.005721
 summary(mod1)
#> 
#> Call:
#> mreg(formula = damaged ~ offset(log(intervisit.time)) + esr.init, 
#>     data = public, patid = ptno, iterlim = 1000, print.level = 1)
#> 
#> 
#> Coefficients:
#>              Estimate      S.E. Z-value Pr(>|Z|)    
#> (Intercept) -6.696170  0.134108 -49.931  < 2e-16 ***
#> esr.init     0.005721  0.003218   1.778   0.0755 .  
#> log.disp    -0.981768  0.146987  -6.679  2.4e-11 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> 
#> Deviance:   1111.489
```
