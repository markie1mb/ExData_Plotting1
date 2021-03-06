## Plot1.R

## Source dataset: 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## This script creates a Histogram of the frequency of  Global Active Power 

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
png('Plot1.png',width = 480, height = 480)
hist(power_2days$Global_active_power,xlab="Global Active Power(kilowats)",main = "Global Active Power", col="red")
dev.off()
