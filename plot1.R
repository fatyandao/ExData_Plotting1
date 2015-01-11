data<-read.csv2('household_power_consumption.txt')
narrowed <- data[data$Date %in% c('1/2/2007','2/2/2007'),]

#plot1
par(mfrow=c(1,1))
hist(as.numeric(as.character(narrowed$Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()
