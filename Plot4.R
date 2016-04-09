## Plot4.R
## Source dataset: 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## This script creates a 4 graphics in one plot

## plot 1 = Global_active_power over time
## plot 2 = Voltage over time
## plot 3 = 3 different sub-meterings over time
## plot 4 = Global reactive power over time.

## Set Directory
data_dir="C:/Users/Marc/Documents/R_Working_dir/exploratory-data-analysis"
setwd(data_dir)

## Read the data
power_cons_df <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?")

## Change Date and Time
power_cons_df$Date<-as.Date(power_cons_df$Date,"%d/%m/%Y")
power_cons_df$Time<-strptime(paste(power_cons_df$Date,power_cons_df$Time),"%Y-%m-%d %H:%M:%S")

## Extract just 2 days
power_2days<-power_cons_df[power_cons_df$Date==as.Date("2007-02-01","%Y-%m-%d"),]
power_2days<-rbind(power_2days,power_cons_df[power_cons_df$Date==as.Date("2007-02-02","%Y-%m-%d"),])

## Make the plot
png('Plot4.png',width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 5, 2, 1), oma = c(0, 0, 2, 0))
with(power_2days,{
    plot(Time,Global_active_power,type="l",ylab="Global Active Power(kilowats)",xlab="") 
    plot(Time,Voltage, type="l",xlab="datetime")
    plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        lines(Time,Sub_metering_2,col="red")
        lines(Time,Sub_metering_3,col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black", "red", "blue"),lty=1,bty="n")
    plot(Time,Global_reactive_power, type="l",xlab="datetime")
    
})
dev.off()
