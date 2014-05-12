data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)
data1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data2 <- as.character(as.Date(data1$Date, "%d/%m/%Y"))
data2a <- paste(data2, data1$Time)
data2b <- strptime(data2a, "%Y-%m-%d %H:%M:%S")
par(mfrow=c(1,1))
plot(data2b, as.numeric(data1$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png")
dev.off()
