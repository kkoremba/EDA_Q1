pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

txt <- paste(pwr$Date, pwr$Time, sep = "-")
pwr$fDate <- strptime(txt, "%d/%m/%Y-%H:%M:%S", tz = "")
pwr2 <- pwr[as.Date(pwr$fDate) <=  as.Date("2007-02-02") & as.Date(pwr$fDate) >=  as.Date("2007-02-01"),]

            #PLOT 4
            
            par(mfcol = c(2,2))
            plot(pwr2$fDate, pwr2$Global_active_power, pch = "", type = "o", ylab = "Global active power (kilowatts)", xlab = "")
            plot(pwr2$fDate, pwr2$Sub_metering_1, type = "o", pch = "", col = "black", ylab = "Energy sub metering", xlab = "")
            lines(pwr2$fDate, pwr2$Sub_metering_2, col = "red")
            lines(pwr2$fDate, pwr2$Sub_metering_3, col = "blue")
            legend("topright", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"), lty = 1, cex=0.7)
            plot(pwr2$fDate, pwr2$Voltage, pch = "", type = "o", ylab = "Voltage", xlab = "datetime")
            plot(pwr2$fDate, pwr2$Global_reactive_power, pch = "", type = "o", ylab = "Global_reactive_power", xlab = "datetime")
            
            dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px" )
            dev.off()