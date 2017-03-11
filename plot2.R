#  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 
#1999 to 2008? Use the base plotting system to make a plot answering this question.

#  reading data
NEI <- readRDS("./summarySCC_PM25.rds")

#  selecting "Baltimore City, Maryland (fips == "24510")" and set it as subsetNEI
subsetNEI  <- NEI[NEI$fips=="24510", ]

#  sum the total of Emissions and "group by" year. More information about tilde (~) char at: 
#http://stackoverflow.com/questions/14078591/what-is-the-meaning-of-in-aggregate
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#  plot in file
png('plot2.png')

#  Creates a bar plot with vertical or horizontal bars
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'), main=expression('Total PM'[2.5]*' emissions at various years'))

#  shuts down current device
dev.off()
