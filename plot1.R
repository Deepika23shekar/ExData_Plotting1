##PLOT 1

## load the data
dataFile <- "household_power_consumption.txt"
data <-  read.table(dataFile,header=T,sep=";",na.strings = "?")
## subset the data
subdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")

##Create a working directory called plot1.png
png("plot1.png", width=480, height=480)

##Plot the histogram
hist(as.numeric(subdata$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
