source("base.R")
year_sum <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)
png(filename = "plot1.png")
with(year_sum, plot(year, x, 
                    type="l", 
                    xlab="Years",
                    ylab="Year wise Emission", 
                    main="Total PM2.5 emissions")
     )
dev.off()
