#  Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
#sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes 
#over time in motor vehicle emissions?

library(ggplot2)

#  reading data
NEI <- readRDS("./summarySCC_PM25.rds")

#  selecting "Baltimore City, Maryland (fips == "24510")", 
#"Los Angeles County, California (fips == "06037")" and  type equal "ON-ROAD" then save it as  
#a new subsetNEI
subsetNEI  <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

#  sum the total of Emissions and "group by" year and fips
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

#  rename columns to city names
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

#  plot in file
png("plot6.png", width=1024, height=800)

#  save the plot object to 'g'
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')

#  plot to file
print(g)

#  shuts down current device
dev.off()