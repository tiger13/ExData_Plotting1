## This script plots the global active power over two days. This
## script assumes that it is in the same directory as the data set.

powerData <- read.table("C:\\Users\\Ron\\Documents\\DataScience\\datasets\\ExploratoryDataAnalysis\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=TRUE, sep = ";")

## Restrict the data to the days of interest.
allDates <- as.Date(powerData[,1], "%d/%m/%Y")
twoDaysPowerData <- powerData[allDates == "2007-02-01" | allDates == "2007-02-02", ]

## Make the plot.
globalActivePower <- as.numeric(as.character(twoDaysPowerData$Global_active_power))

plot(globalActivePower, xaxt = "n", xlab = "", ylab="Global Active Power (kilowatts)", col="black", main="", type="l")
## There are 1440 minutes in a day.
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## We could specify the height and width of the
## png as 480 x 480, but these are already the default values.
dev.copy(png, file="plot2.png")
dev.off()
