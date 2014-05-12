data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data2 <- as.character(as.Date(data1$Date, "%d/%m/%Y"))
data2a <- paste(data2, data1$Time)
data2b <- strptime(data2a, "%Y-%m-%d %H:%M:%S")
par(mfrow=c(1,1))
plot(data2b, as.numeric(data1$Sub_metering_1), type="l",
     ylab="Energy Submetering", xlab="")
lines(data2b, as.numeric(data1$Sub_metering_2), type="l", col="red")
lines(data2b, as.numeric(data1$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6,lty=1, lwd =1,col=c("black", "red", "blue"))
dev.copy(png,file="plot3.png")
dev.off()
