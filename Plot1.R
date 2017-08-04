setwd("C:/Users/spbstsoy/Documents/Course4Week1")

data=read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)
head(data)

##Converting to Date/Time format
data$DateTime=paste(data$Date,data$Time)
data$DateTime=strptime(data$DateTime,format='%d/%m/%Y %H:%M:%S')

##We will only be using data from the dates 2007-02-01 and 2007-02-02
library(dplyr)
data$DateTime <- as.POSIXct(data$DateTime)
datatouse=filter(data, (data$DateTime <= "2007-02-02 23:59:59")&(data$DateTime >= "2007-02-01 00:00:00"))


## There is no need to convert all these variables for this particular plot. I would use just one R script for all 4 plots :)

datatouse$Global_active_power=as.numeric(as.character(datatouse$Global_active_power))
datatouse$Sub_metering_1=as.numeric(as.character(datatouse$Sub_metering_1))
datatouse$Sub_metering_2=as.numeric(as.character(datatouse$Sub_metering_2))
datatouse$Sub_metering_3=as.numeric(as.character(datatouse$Sub_metering_3))
datatouse$Voltage=as.numeric(as.character(datatouse$Voltage))
datatouse$Global_reactive_power =as.numeric(as.character(datatouse$Global_reactive_power))

## plot #1

png("plot1.png", width=480, height=480)

hist(datatouse$Global_active_power,
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")

dev.off() 

