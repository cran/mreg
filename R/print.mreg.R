#' Prints the coefficients from an mreg object
#'
#' @param x an mreg object
#' @param digits number of digits to print decimals to.
#' @param ... other arguments, not currently used but required for generic methods
#'
#' @returns It prints the coefficients from an
#' \code{\link{mreg}} regression model.
#' @seealso \code{\link{mreg}} \code{\link{summary.mreg}}
#'
#' @keywords print
#' @export



print.mreg <- function(x, digits = max(3, getOption("digits") - 3),...) {
cat("\nCall:\n", deparse(x$call), "\n\n", sep = "")
    if (length(x$coefficients)) {
        cat("Coefficients:\n")
        print.default(format(x$coefficients, digits = digits), print.gap = 2,
            quote = FALSE)
	if( !is.null(x$root.dispersion)){
	cat("\n\nNuisance Parameters:\n")
	print.default( format(x$nuisance$estimate, digits=digits),print.gap=2,
		quote=FALSE)
	}
    }
    else cat("No coefficients\n")
    cat("\n")
    invisible(x)


}

