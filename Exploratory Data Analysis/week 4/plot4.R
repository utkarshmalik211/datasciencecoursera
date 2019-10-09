source("base.R")
coal_class_code <- SCC[grepl("Coal", SCC$Short.Name), ]
coal_emissions_data <- NEI[NEI$SCC %in% SCC$SCC, ]

## sum up emissions by year
coal_emissions_year <- aggregate(coal_emissions_data$Emissions, 
                                 by=list(coal_emissions_data$year), FUN=sum)
colnames(coal_emissions_year) <- c("year", "emissions")

## create a plot showing coal related emissions across the US from 1999-2008
png(filename = "plot4.png")
plot(coal_emissions_year$year, coal_emissions_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()
