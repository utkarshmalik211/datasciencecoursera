source("base.R")
data <- readData()
png("plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
