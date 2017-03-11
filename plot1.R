#  Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base 
#plotting system, make a plot showing the total PM2.5 emission from all sources for each of the 
#years 1999, 2002, 2005, and 2008.

#  reading data
NEI <- readRDS("./summarySCC_PM25.rds")

#  sum the total of Emissions and "group by" year. More information about tilde (~) char at: 
#http://stackoverflow.com/questions/14078591/what-is-the-meaning-of-in-aggregate
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

#  plot in file
png('plot1.png')

#  Creates a bar plot with vertical or horizontal bars
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'), main=expression('Total PM'[2.5]*' emissions at various years'))

#  shuts down current device
dev.off()
