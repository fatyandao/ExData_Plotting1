data<-read.csv2('household_power_consumption.txt')
narrowed <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

#plot 2
par(mfrow=c(1,1))
narrowed$Date = as.Date(narrowed$Date, format="%d/%m/%Y")
narrowed$Global_active_power = as.numeric(as.character(narrowed$Global_active_power))
narrowed$DateTime <- paste(narrowed$Date,narrowed$Time)
narrowed$DateTime <- as.POSIXct(narrowed$DateTime)

plot(narrowed[,c("DateTime","Global_active_power")], col="black", ylab="Global Active Power (kilowatts)", main="Global Active Power", type="l")
dev.copy(png, file="plot2.png")
dev.off()



