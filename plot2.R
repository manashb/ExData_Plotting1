plot2 <- function(){
  power <- read.table("../household_power_consumption.txt", sep=";", na.strings = "?", skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  Global_active_power <- as.numeric(as.character(power$Global_active_power))
  power <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  plot(power$timestamp,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file = "plot2.png")
  dev.off()
}