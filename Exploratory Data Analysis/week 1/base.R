library(dplyr)
library(lubridate)
library(tidyr)

readData <- function() {
    hpc <- read.table("household_power_consumption.txt", sep=";", dec = ".", stringsAsFactors = FALSE, header = TRUE)
    hpc <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"),]
    hpc
}