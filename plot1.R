pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

txt <- paste(pwr$Date, pwr$Time, sep = "-")
pwr$fDate <- strptime(txt, "%d/%m/%Y-%H:%M:%S", tz = "")
pwr2 <- pwr[as.Date(pwr$fDate) <=  as.Date("2007-02-02") & as.Date(pwr$fDate) >=  as.Date("2007-02-01"),]


#PLOT 1
par(mfcol = c(1,1))
hist(pwr2$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px" )
dev.off()
