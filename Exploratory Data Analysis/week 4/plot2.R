source("base.R")
maryland <- subset(NEI, NEI$fips == "24510")
year_sum <- aggregate(maryland$Emissions, by=list(year=maryland$year), FUN=sum)
png(filename = "plot2.png")
with(year_sum, plot(year, x, 
                    type="l", 
                    xlab="Years",
                    ylab="Year wise Emission", 
                    main="Total PM2.5 emissions of Maryland")
)
dev.off()
