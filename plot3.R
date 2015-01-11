createplot3 <- function(){
	
	# Subset data based on date criteria
	housedata <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep = ";")
	colnames(housedata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	
	# Merge Date and Time into one field
	housedata$DateTime <- paste(housedata$Date, housedata$Time)
	housedata$DateTime <- strptime(housedata$DateTime, "%d/%m/%Y %H:%M:%S")
	
	# Plots the data. The first is done using plot and the other two using lines
	with(housedata, {
	plot(DateTime, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "", col = "black", bg = "white")
	lines(DateTime, Sub_metering_2,col="red")
	lines(DateTime, Sub_metering_3, col="blue")
	legend("topright", col=c("black", "red", "blue"), lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	})
	
	# Upload to a png file
	dev.copy(png, file = "plot3.png")
	dev.off()
}

