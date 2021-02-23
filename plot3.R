##PLOT 3

## load the data
dataFile <- "household_power_consumption.txt"
data <-  read.table(dataFile,header=T,sep=";",na.strings = "?")

## subset the data
subdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")


##Use of strptime function to merge data and time in date format

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subdata$Global_active_power)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

## create a working directory called plot3.png
png("plot3.png", width=480, height=480)

## plotting the graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()