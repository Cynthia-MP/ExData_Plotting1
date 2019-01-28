##############################plot1.R#########################################
# This is code to create a histogram based on the houshold power consumption #
# data from cloudfront,net, this Code developed by Cynthia McGowan Poole     #
# as part of the WK 1 course project 1 requirements.                          #
##############################################################################

## Get the Data for Plotting
if(!file.exists("./data_plot1")){dir.create("./data_plot1")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data_plot1/household_power_consumption.zip")


##Unzip the dataset
unzip(zipfile = "./data_plot1/household_power_consumption.zip", exdir = "./data_plot1")

##Set working Directory to the data_plot1 directory
setwd("./data_plot1")

##Get list of files in the dataset
list.files()
# [1] "household_power_consumption.txt" "household_power_consumption.zip"

##read the household_power_consumption.txt into a table
file = "household_power_consumption.txt"
hpcdata <- read.csv2(file, header = TRUE, sep = ";")


## Get the names of the variables in the dataset
names(hpcdata)
# [1] "Date"                  "Time"                  "Global_active_power"  
# [4] "Global_reactive_power" "Voltage"               "Global_intensity"     
# [7] "Sub_metering_1"        "Sub_metering_2"        "Sub_metering_3" 

## Subset the data to 2007-02-01 and 2007-02-02
library(dplyr)
subset_data <- filter(hpcdata,hpcdata$Date == "1/2/2007" | hpcdata$Date == "2/2/2007")



## Create plot1.png
png("plot1.png", width=480, height=480)


## Set up Histogram title and labels 
hist(as.numeric(as.character(subset_data$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

# Close the device
dev.off()