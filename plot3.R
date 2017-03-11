#  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
#plot answer this question.

#  include ggplot2 library
library(ggplot2)

#  reading data
NEI <- readRDS("./summarySCC_PM25.rds")

#  selecting "Baltimore City, Maryland (fips == "24510")" and set it as subsetNEI
subsetNEI  <- NEI[NEI$fips=="24510", ]

#  sum the total of Emissions and "group by" year and type. More information about tilde (~) char 
#at: http://stackoverflow.com/questions/14078591/what-is-the-meaning-of-in-aggregate
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

#  plot in file
png("plot3.png", width=800, height=600)

#  save the plot object to 'g'
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')

#  plot to file
print(g)

#  shuts down current device
dev.off()
