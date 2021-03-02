#Opening the table with the houshold power consumption data and storing it to the variable PWConsumption
PWConsumption <- read.csv("../Power_Consumption/household_power_consumption.txt", header = TRUE, sep=";", )

#Changing the date format to POSIXlt
PWConsumption$Date <- as.Date(PWConsumption$Date, format ="%d/%m/%Y")

#subseting the data to only use the dates 2007-02-01 and 2007-02-02
PWData <- subset(PWConsumption, PWConsumption == "2007-02-01" | PWConsumption =="2007-02-02")

#Joining the Date and Time variable
PWData$TimeandDate <- as.POSIXct(paste(PWData$Date, PWData$Time))

#Changing the date time names to English
Sys.setlocale("LC_TIME", "English")

#Creating plot Days vs. Global active Power and saving it to Plot2.png and closing off the device
png("Plot2.png", width = 480, height = 480)
plot(PWData$TimeandDate, PWData$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "", type = "l")
dev.off()
