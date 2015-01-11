data<-read.csv2('household_power_consumption.txt')
narrowed <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

#plot 2
par(mfrow=c(1,1))
narrowed$Date = as.Date(narrowed$Date, format="%d/%m/%Y")
narrowed$Global_active_power = as.numeric(as.character(narrowed$Global_active_power))
narrowed$DateTime <- paste(narrowed$Date,narrowed$Time)
narrowed$DateTime <- as.POSIXct(narrowed$DateTime)





#Plot 3
narrowed$Sub_metering_1 = as.numeric(as.character(narrowed$Sub_metering_1))
narrowed$Sub_metering_2 = as.numeric(as.character(narrowed$Sub_metering_2))
narrowed$Sub_metering_3 = as.numeric(as.character(narrowed$Sub_metering_3))

#plot 4

par(mfrow=c(2,2))
narrowed$Global_reactive_power = as.numeric(as.character(narrowed$Global_reactive_power))
#plot4.1
hist(as.numeric(as.character(narrowed$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#plot 4.2
plot(narrowed[,c("DateTime","Global_active_power")], col="black", ylab="Global Active Power (kilowatts)", main="Global Active Power", type="l")
#plot4.3
plot(narrowed[,c("DateTime","Sub_metering_1")], col="black", xlab="", ylab="Global Active Power (kilowatts)", main="Global Active Power", type="l")
lines(narrowed[,c("DateTime","Sub_metering_2")], col="red", ylab="Global Active Power (kilowatts)", main="Global Active Power", type="l")
lines(narrowed[,c("DateTime","Sub_metering_3")], col="blue", ylab="Global Active Power (kilowatts)", main="Global Active Power", type="l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch="---")
#plot4.4
plot(narrowed[,c("DateTime","Global_reactive_power")], col="black", ylab="Global Active Power (kilowatts)", main="Global Active Power", type="l")
dev.copy(png, file="plot4.png")
dev.off()
