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

#Creating plot Days vs. Energy submetering1 2 and 3, and saving it to Plot3.png and closing off the device

png("Plot3.png", width = 480, height = 480)
plot(PWData$TimeandDate, as.character(PWData$Sub_metering_1),   ylab = "Energy sub metering",xlab = "", type = "l", col ="black")
lines(PWData$TimeandDate, as.character(PWData$Sub_metering_2),   ylab = "Energy sub metering",xlab = "", type = "l", col ="red")
lines(PWData$TimeandDate, as.character(PWData$Sub_metering_3),   ylab = "Energy sub metering",xlab = "", type = "l", col ="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=c(1,1), lwd=c(1,1)  )
dev.off()
