## This script makes a histogram of the global active power over two days. This
## script assumes that it is in the same directory as the data set.

##powerData <- read.table("C:\\Users\\Ron\\Documents\\DataScience\\datasets\\ExploratoryDataAnalysis\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=TRUE, sep = ";")
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

## Restrict the data to the days of interest.
allDates <- as.Date(powerData[,1], "%d/%m/%Y")
twoDaysPowerData <- powerData[allDates == "2007-02-01" | allDates == "2007-02-02", ]

## Make the histogram. Although we could specify the height and width of the
## png as 480 x 480, these are the default values.
hist(as.numeric(as.character(twoDaysPowerData$Global_active_power)), xlab="Global Active Power (kilowatts)", col="orange", main="")
dev.copy(png, file="plot1.png")
dev.off()
