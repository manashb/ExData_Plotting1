plot1 <- function(){
  power <- read.table("../household_power_consumption.txt", na.strings = "?", skip = 66637, nrows = 2880, sep = ";", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  global_active_power <- as.numeric(power$Global_active_power)
  hist(global_active_power, col = "red", xlab = "Global active power(kilowats)", main = "Global active power")
  dev.copy(png, file = "plot1.png")
  dev.off()
}