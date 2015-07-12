
## Read data from file
fulldata <- read.csv("household_power_consumption.txt", sep = ";", na.strings=c("?"), stringsAsFactors = FALSE)

#Filter on dates
data <- fulldata[fulldata$Date=="1/2/2007" | fulldata$Date=="2/2/2007",]

## Create histogram to png
png("plot1.png", width = 480, height = 480, res = 72)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");
dev.off()