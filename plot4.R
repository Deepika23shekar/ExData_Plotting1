##PLOT 3

## load the data
dataFile <- "household_power_consumption.txt"
data <-  read.table(dataFile,header=T,sep=";",na.strings = "?")

## subset the data
subdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subdata$Global_active_power)
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)
voltage <- as.numeric(subdata$Voltage)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)

## create a working directory called plot4.png
png("plot4.png", width=480, height=480)

##initiating a composite plot with many graphs
par(mfrow = c(2, 2)) 

##Plotting the 4 graphs

## First graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## Second graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Third graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## Fourth graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()