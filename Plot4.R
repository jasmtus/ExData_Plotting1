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

#Creating a png file 
png("Plot4.png",  width = 480, height = 480)
#Creating space for 4 plots
par(mfcol=c(2,2))

#Plot2
plot(PWData$TimeandDate, PWData$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "", type = "l")

#Plot3
plot(PWData$TimeandDate, as.character(PWData$Sub_metering_1),   ylab = "Energy sub metering",xlab = "", type = "l", col ="black")
lines(PWData$TimeandDate, as.character(PWData$Sub_metering_2),   ylab = "Energy sub metering",xlab = "", type = "l", col ="red")
lines(PWData$TimeandDate, as.character(PWData$Sub_metering_3),   ylab = "Energy sub metering",xlab = "", type = "l", col ="blue")
legend("topright", col = c("black", "red", "blue"), c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=c(1,1), lwd=c(1,1)  )

#Creating plot datetime vs. Voltage
plot(PWData$TimeandDate, as.numeric(as.character(PWData$Voltage)), type = "l", xlab ="datetime", ylab="Voltage")

#Creating plot datetime vs. Global reactive power
plot(PWData$TimeandDate, as.numeric(as.character(PWData$Global_reactive_power)), type = "l", xlab ="datetime", ylab="Global_reactive_power")

dev.off()