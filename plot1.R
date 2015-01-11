createplot1 <- function(){
	# Subset Data based on two dates
	housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
	colnames(housedata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	
	#Plot data using hist function
	with(housedata, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" ))
	
	# Upload to a png file
	dev.copy(png, file = "plot1.png")
	dev.off()
}

