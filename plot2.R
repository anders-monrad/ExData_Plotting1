
## Read data from file
fulldata <- read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?"), stringsAsFactors = FALSE)

#Filter on dates
data <- fulldata[fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007",]

#Introduce combine date time
data$new_date <- strptime(paste( data[,1], data[,2] ), format="%d/%m/%Y %H:%M:%S")

## Create linechart to png
png("plot2.png", width = 480, height = 480, res = 72)
plot(data$new_date, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()