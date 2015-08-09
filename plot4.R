## This script plots four different graphs simultaneously. This
## script assumes that it is in the same directory as the data set.

powerData <- read.table("C:\\Users\\Ron\\Documents\\DataScience\\datasets\\ExploratoryDataAnalysis\\exdata-data-household_power_consumption\\household_power_consumption.txt", header=TRUE, sep = ";")

## Restrict the data to the days of interest.
allDates <- as.Date(powerData[,1], "%d/%m/%Y")
twoDaysPowerData <- powerData[allDates == "2007-02-01" | allDates == "2007-02-02", ]

## Make the four plots.
par(mfcol=c(2,2))

## Make the first plot.
globalActivePower <- as.numeric(as.character(twoDaysPowerData$Global_active_power))

plot(globalActivePower, xaxt = "n", xlab = "", ylab="Global Active Power (kilowatts)", col="black", main="", type="l")
## There are 1440 minutes in a day.
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## Make the second plot.
submetering1 <- as.numeric(as.character(twoDaysPowerData$Sub_metering_1))
submetering2 <- as.numeric(as.character(twoDaysPowerData$Sub_metering_2))
submetering3 <- as.numeric(as.character(twoDaysPowerData$Sub_metering_3))

plot(submetering1, xaxt = "n", xlab = "", ylab="Energy submetering", col="black", main="", type="l")
lines(submetering2, col = "red")
lines(submetering3, col = "blue")

legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("1", "2", "3"), y.intersp=0.15, bty="n")

## There are 1440 minutes in a day.
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## Make the third plot.
plot(as.numeric(as.character(twoDaysPowerData$Voltage)), xaxt="n", xlab="datetime", ylab = "Voltage", type="l")

## There are 1440 minutes in a day.
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## Make the fourth plot.
globalReactivePower <- as.numeric(as.character(twoDaysPowerData$Global_reactive_power))
plot(globalReactivePower, xaxt="n", xlab="datetime", ylab = "Global_reactive_power", type="l")

## There are 1440 minutes in a day.
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## We could specify the height and width of the
## png as 480 x 480, but these are already the default values.
dev.copy(png, file="plot4.png")
dev.off()
