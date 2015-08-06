pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

txt <- paste(pwr$Date, pwr$Time, sep = "-")
pwr$fDate <- strptime(txt, "%d/%m/%Y-%H:%M:%S", tz = "")
pwr2 <- pwr[as.Date(pwr$fDate) <=  as.Date("2007-02-02") & as.Date(pwr$fDate) >=  as.Date("2007-02-01"),]


#PLOT 2
par(mfcol = c(1,1))
plot(pwr2$fDate, pwr2$Global_active_power, pch = "", type = "o", ylab = "Global active power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px" )
dev.off()
