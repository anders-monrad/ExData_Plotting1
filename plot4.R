
## Read data from file
fulldata <- read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?"), stringsAsFactors = FALSE)

#Filter on dates
data <- fulldata[fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007",]

#Introduce combine date time
data$new_date <- strptime(paste( data[,1], data[,2] ), format="%d/%m/%Y %H:%M:%S")

## Create histogram
png("plot4.png", width = 480, height = 480, res = 72)

par(mfrow = c(2,2))

with( data, plot(new_date, Global_active_power, type="l", xlab = "", ylab = "Global Active Power") )

with( data, plot(new_date, Voltage, type="l", xlab = "datetime", ylab = "Voltage") )

with( data, plot(new_date, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with( data, points(new_date, Sub_metering_2, type="l", col="red"))
with( data, points(new_date, Sub_metering_3, type="l", col="blue"))
legend("topright", lwd="1", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

with( data, plot(new_date, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power") )

dev.off()