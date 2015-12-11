# This program draws the Plot 3 mentioned in
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

plot(df$Date,df$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
points(df$Date, df$Sub_metering_2, type = "l", col = "red")
points(df$Date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy plot to Plot3.png file
dev.copy(png, file = "Plot3.png", height=480, width=480)
dev.off()
