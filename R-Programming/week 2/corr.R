corr <- function(directory, threshold = 0) {
    nobs <- data.frame(complete("specdata"))
    nobs <- nobs[nobs["nobs"] > threshold, ]
    ret <- c()
    for(i in nobs[["id"]]) {
        ppmFile <- data.frame()
        if (nchar(toString(i)) == 1) {
            ppmFile <- read.csv(file.path(directory, paste("00", toString(i), ".csv", sep = "")))
        } else if (nchar(toString(i)) == 2) {
            ppmFile <- read.csv(file.path(directory, paste("0", toString(i), ".csv", sep = "")))
        } else if (nchar(toString(i)) == 3) {
            ppmFile <- read.csv(file.path(directory, paste(toString(i), ".csv",sep = "")))
        }
        ppmFile <- ppmFile[complete.cases(ppmFile),]
        ret <- c(ret, cor(ppmFile$sulfate, ppmFile$nitrate))
    }
    ret
}