## This script plots the three submetering measurements over two days. This
## script assumes that it is in the same directory as the data set.

##powerData <- read.table("C:\\Users\\Ron\\Documents\\DataScience\\datasets\\ExploratoryDataAnalysis\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=TRUE, sep = ";")
powerData <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")

## Restrict the data to the days of interest.
allDates <- as.Date(powerData[,1], "%d/%m/%Y")
twoDaysPowerData <- powerData[allDates == "2007-02-01" | allDates == "2007-02-02", ]

## Make the plot.
submetering1 <- as.numeric(as.character(twoDaysPowerData$Sub_metering_1))
submetering2 <- as.numeric(as.character(twoDaysPowerData$Sub_metering_2))
submetering3 <- as.numeric(as.character(twoDaysPowerData$Sub_metering_3))

plot(submetering1, xaxt = "n", xlab = "", ylab="Energy submetering", col="black", main="", type="l")
lines(submetering2, col = "red")
lines(submetering3, col = "blue")

legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("submetering1", "submetering2", "submetering3"), text.width=750)

## There are 1440 minutes in a day.
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## We could specify the height and width of the
## png as 480 x 480, but these are already the default values.
dev.copy(png, file="plot3.png")
dev.off()
