#  How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

#  reading data
NEI <- readRDS("./summarySCC_PM25.rds")

#  selecting "Baltimore City, Maryland (fips == "24510")" and type equal "ON-ROAD" then save it as  
#a new subsetNEI
subsetNEI  <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]

#  sum the total of Emissions and "group by" year
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#  plot in file
png("plot5.png", width=800, height=600)

#  save the plot object to 'g'
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from vehicles (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')

#  plot to file
print(g)

#  shuts down current device
dev.off()
