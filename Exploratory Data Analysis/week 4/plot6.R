source("base.R")
baltLA_car_data <- subset(NEI, NEI$fips=="24510" |
                              NEI$fips=="06037" &
                              NEI$type=="ON-ROAD")
baltLA_car_year <- aggregate(baltLA_car_data$Emissions, 
                             by=list(baltLA_car_data$fips, baltLA_car_data$year),
                             FUN=sum)
colnames(baltLA_car_year) <- c("City", "Year", "Emissions")

library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = baltLA_car_year, color = City, geom = "line") +
    ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + 
    ylab("Total Emissions from motor vehicles (tons)") + 
    xlab("Year") 
dev.off()