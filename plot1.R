createplot1 <- function(){
	housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
	colnames(housedata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	with(housedata, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" ))
}

