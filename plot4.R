createplot4 <- function(){

	housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
	colnames(housedata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	housedata$DateTime <- paste(housedata$Date, housedata$Time)
	housedata$DateTime <- strptime(housedata$DateTime, "%d/%m/%Y %H:%M:%S")
	par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
	with(housedata, {
		plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
		plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
		plot(DateTime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", col = "black", bg = "white")
		lines(DateTime, Sub_metering_2,col="red")
		lines(DateTime, Sub_metering_3, col="blue")
		legend("topright", col=c("black", "red", "blue"), lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
	})
}