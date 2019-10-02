source("rankhospital.R")
rankall <- function(outcome, num = "best") {
    hospitals <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    states <- levels(as.factor(hospitals$State))
    output <- matrix(ncol=2, nrow=length(states))
    for (i in 1:length(states)){
        hospital <- rankhospital(states[i], outcome, num)
        output[i, ] <- c(states[i], hospital)
    }
    output <- as.data.frame(output)
    names(output) <- c("state", "hospital")
    
    output
}