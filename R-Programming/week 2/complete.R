complete <- function(directory, id = 1:332) {
    fileId <- c()
    nobs <- c()
    for(i in id) {
        if (nchar(toString(i)) == 1) {
            ppmFile <- read.csv(file.path(directory, paste("00", toString(i), ".csv", sep = "")))
        } else if (nchar(toString(i)) == 2) {
            ppmFile <- read.csv(file.path(directory, paste("0", toString(i), ".csv", sep = "")))
        } else if (nchar(toString(i)) == 3) {
            ppmFile <- read.csv(file.path(directory, paste(toString(i), ".csv",sep = "")))
        }
        fileId <- c(fileId, i)
        nobs <- c(nobs, sum(complete.cases(ppmFile)))
    }
    id <- fileId
    ret <- cbind(id, nobs)
    names(ret) <- c("id", "nobs")
    data.frame(ret)
}