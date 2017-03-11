#  Across the United States, how have emissions from coal combustion-related sources changed from 
#1999–2008?

library(ggplot2)

#  reading data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

#  merging NEI and SCC using the column SCC as matching criteria
mergedNeiScc <- merge(NEI, SCC, by="SCC")

#  matching "coal" at merged table's Short.Name column
coalMatches  <- grepl("coal", mergedNeiScc$Short.Name, ignore.case=TRUE)

#  storing these data in a new subset
subsetMerged <- mergedNeiScc[coalMatches, ]

#  sum the total of Emissions and "group by" year
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetMerged, sum)

#  plot in file
png("plot4.png", width=800, height=600)

#  save the plot object to 'g'
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')

#  plot to file
print(g)

#  shuts down current device
dev.off()
