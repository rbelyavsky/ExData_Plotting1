setwd("C:/Users/rbelyavsky/Documents/datasciencecoursera/ExploratoryAnalysis")

## Unzip the data file to your working directory
## Read in the data file
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

## Convert the date and time columns into the correct class
power$Date <- as.Date(power$Date,"%d/%m/%Y")

## Subset the data to only Feb 1 and 2 of 2007
data <- subset(power,power$Date == "2007-02-01" | power$Date == "2007-02-02")

## Create the datetime variable
data$datetime <- as.POSIXlt(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

## Create plot 3 on the screen device
plot(data$datetime,data$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="")
with(data,lines(datetime,Sub_metering_1))
with(data,lines(datetime,Sub_metering_2,col="red"))
with(data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty=c(1,1),lwd=c(1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.9)

## Copy plot 3 to a png file
dev.copy(png,file="plot3.png")
dev.off()