source("base.R")
baltimore_car_data <- subset(NEI, NEI$fips=="24510" 
                             & NEI$type=="ON-ROAD")
baltimore_car_year <- aggregate(baltimore_car_data$Emissions, 
                                by=list(baltimore_car_data$year), FUN=sum)
colnames(baltimore_car_year) <- c("Year", "Emissions")

## create plot showing car related emissions in Baltimore City from 1999-2008
png(filename = "plot5.png")
plot(baltimore_car_year$Year, baltimore_car_year$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()