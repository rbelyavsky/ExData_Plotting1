setwd("C:/Users/rbelyavsky/Documents/datasciencecoursera/ExploratoryAnalysis")

## Unzip the data file to your working directory
## Read in the data file
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

## Convert the date and time columns into the correct class
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(power$Time, "%H:%M:%S")

## Subset the data to only Feb 1 and 2 of 2007
data <- subset(power,power$Date == "2007-02-01" | power$Date == "2007-02-02")

## Create plot 1 on the screen device
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Copy plot 1 to a png file
dev.copy(png,file="plot1.png")
dev.off()