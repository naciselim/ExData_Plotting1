# This program draws the Plot 2 mentioned in
# https://github.com/rdpeng/ExData_Plotting1

setwd("d:/Coursera")  # not this is correct on my laptop only

# I convert them to POSIXct so that I can compare dates.
firstDate <- as.POSIXct("2007-02-01")
endDate <- as.POSIXct("2007-02-03") # exclusive

# my laptop memory and cpu is OK to read this huge file in short time
df <- read.table("household_power_consumption.txt",
    colClasses = c("character","character",rep("numeric",5)),
    header = TRUE,sep = ";", na.strings = "?")

df$Date <- strptime(paste(df$Date,df$Time,sep=" "),
        "%d/%m/%Y %H:%M:%S")
df$Time <- NULL  # no need to but to clean it up a bit

# select data on the given dates only
df <- subset(df, df$Date > firstDate & df$Date < endDate)

plot(df$Date,df$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# copy plot to Plot1.png file
dev.copy(png, file = "Plot2.png", height=480, width=480)
dev.off()
