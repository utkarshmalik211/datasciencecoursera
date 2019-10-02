rankhospital <- function(state, outcome, num = "best", data = NA) {
    firstup <- function(x) {
        substr(x, 1, 1) <- toupper(substr(x, 1, 1))
        x
    }
    if (is.na(data)){
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    }
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
    currState[outcomeColName] <- as.numeric(currState[, outcomeColName])
    currData <- currState[complete.cases(currState), ]
    currData <- currData[order(currData[outcomeColName], currData["Hospital.Name"]), "Hospital.Name"]

    if (num == "best") {
        return (currData[1])
    } else if (num == "worst"){
        return(tail(currData, 1))
    } else if (is.numeric(num)) {
        if (num %in% 1:length(currData)){
            return(currData[num])
        } else {
            return(NA)
        }
    }
}