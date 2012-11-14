#' Date Formatting Check
#'
#' Checks that the user-supplied date is in the format YYYY-MM-DD and month is less than 13, and dates are less than 32.
#'
#' @param date string date to check
#' @keywords data import from web service
#' @return Date logical
#' @export
#' @examples
#' dateFormatCheck('1985-01-01')
#' dateFormatCheck('01/01/1985')
dateFormatCheck <- function(date){  # checks for the format YYYY-MM-DD
  parts <- strsplit(date,"-",fixed=TRUE)
  condition <- FALSE
  if (length(parts[[1]])>1) {
    if (nchar(parts[[1]][1]) == 4 && nchar(parts[[1]][2]) == 2 && nchar(parts[[1]][3]) == 2){
      testYear <- as.numeric(parts[[1]][1])
      testMonth <- as.numeric(parts[[1]][2])
      testDay <- as.numeric(parts[[1]][3])
      if (!is.na(testYear) && !is.na(testMonth) && !is.na(testDay)){
        if (testMonth <= 12 && testDay <= 31){
          condition <- TRUE
        }        
      }      
    }
  }
  return(condition)
}