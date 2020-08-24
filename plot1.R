setwd("E:/Coursera (R)")
library("data.table")
df1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
df1[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
df1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
df1 <- df1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
png("plot1.png", width=480, height=480)
hist(df1[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
