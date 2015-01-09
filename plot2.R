createplot2 <- function(){

	housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
	colnames(housedata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	housedata$DateTime <- paste(housedata$Date, housedata$Time)
	housedata$DateTime <- strptime(housedata$DateTime, "%d/%m/%Y %H:%M:%S")
	with(housedata, plot(DateTime ,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
	
}

