firstup <- function(x) {
    substr(x, 1, 1) <- toupper(substr(x, 1, 1))
    x
}
best <- function(state, outcome) {
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    #data <- data[, c(2, 7, 11)]
    currState <- data[data["State"] == state, ]
    if (nrow(currState) == 0) {
        stop("invalid state")
    }
    mortalityColBaseName <- "Hospital.30.Day.Death..Mortality..Rates.from"
    splitedOutcome <- strsplit(outcome, " ")
    outcomeColName <- paste(c(mortalityColBaseName, unlist(firstup(splitedOutcome[[1]]))), collapse = ".")
    if (!(outcomeColName %in% names(currState))) {
        stop("invalid outcome")
    }
    currData <- currState[complete.cases(currState), c("Hospital.Name", outcomeColName)]
    minData <- currData[currData[outcomeColName] == min(currData[[outcomeColName]]),]
    minData <- minData[order(minData$Hospital.Name), "Hospital.Name"]
    minData[1]
}
