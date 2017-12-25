plot4 <- function(){
  power <- read.table("../household_power_consumption.txt", sep=";", na.strings = "?", skip = 66637, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  Global_active_power <- as.numeric(as.character(power$Global_active_power))
  Global_reactive_power <- as.numeric(as.character(power$Global_reactive_power))
  power <- transform(power, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  Sub_metering_1 <- as.numeric(as.character(power$Sub_metering_1))
  Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2))
  Sub_metering_3 <- as.numeric(as.character(power$Sub_metering_3))
  Voltage <- as.numeric(as.character(power$Voltage))
  
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(power$timestamp,Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(power$timestamp,Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(power$timestamp,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(power$timestamp,Sub_metering_2,col="red")
  lines(power$timestamp,Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
  
  #PLOT 4
  plot(power$timestamp,Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file = "plot4.png")
  dev.off()
}