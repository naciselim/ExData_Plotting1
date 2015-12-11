# This program draws the Plot 1 mentioned in
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

df <- subset(df, df$Date > firstDate & df$Date < endDate)
hist(df$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# copy plot to Plot1.png file
dev.copy(png, file = "Plot1.png", height=480, width=480)
dev.off()
