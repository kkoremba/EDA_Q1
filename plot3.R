pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

txt <- paste(pwr$Date, pwr$Time, sep = "-")
pwr$fDate <- strptime(txt, "%d/%m/%Y-%H:%M:%S", tz = "")
pwr2 <- pwr[as.Date(pwr$fDate) <=  as.Date("2007-02-02") & as.Date(pwr$fDate) >=  as.Date("2007-02-01"),]


#PLOT 3
par(mfcol = c(1,1))
plot(pwr2$fDate, pwr2$Sub_metering_1, type = "o", pch = "", col = "black", ylab = "Energy sub metering", xlab = "")
lines(pwr2$fDate, pwr2$Sub_metering_2, col = "red")
lines(pwr2$fDate, pwr2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex=1)

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px" )
dev.off()
