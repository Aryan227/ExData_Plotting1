setwd("E:/Coursera (R)")
library("data.table")
df1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
df1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
df1[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
df1 <- df1[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot3.png", width=480, height=480)
plot(df1[, dateTime], df1[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(df1[, dateTime], df1[, Sub_metering_2],col="red")
lines(df1[, dateTime], df1[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.off()