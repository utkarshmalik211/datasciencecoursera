pollutantmean <- function(directory, polutant, id = 1:332) {
    meanVector <- c()
    for(i in id) {
        if (nchar(toString(i)) == 1) {
            ppmFile <- read.csv(file.path(directory, paste("00", toString(i), ".csv", sep = "")))
        } else if (nchar(toString(i)) == 2) {
            ppmFile <- read.csv(file.path(directory, paste("0", toString(i), ".csv", sep = "")))
        } else if (nchar(toString(i)) == 3) {
            ppmFile <- read.csv(file.path(directory, paste(toString(i), ".csv",sep = "")))
        }
        ppmCol <- ppmFile[polutant]
        ppmCol <- ppmCol[!is.na(ppmCol)]
        meanVector <- c(meanVector, ppmCol)
    }
    mean(meanVector)
}
