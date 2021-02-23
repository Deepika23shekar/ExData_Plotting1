##PLOT 2

## load the data
dataFile <- "household_power_consumption.txt"
data <-  read.table(dataFile,header=T,sep=";",na.strings = "?")

## subset the data
subdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

##Use of strptime function to merge data and time in date format
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## create a working directory called plot2.png
png("plot2.png", width=480, height=480)

## Plotting the graph 
plot(datetime, as.numeric(subdata$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()