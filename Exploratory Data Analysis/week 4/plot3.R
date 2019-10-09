source("base.R")
library(ggplot2)
maryland <- subset(NEI, NEI$fips == "24510")
year_sum <- aggregate(maryland$Emissions, by=list(maryland$type, maryland$year), FUN=sum)
colnames(year_sum) <- c( "Type", "Year", "Emissions")

png(filename = "plot3.png")

qplot(Year, Emissions, data=year_sum, color = Type, geom = "line") +
    ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
    ylab("Total Emissions (tons)") + 
    xlab("Year")

dev.off()
