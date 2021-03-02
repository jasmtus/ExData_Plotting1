
#Opening the table with the houshold power consumption data and storing it to the variable PWConsumption
PWConsumption <- read.csv("../Power_Consumption/household_power_consumption.txt", header = TRUE, sep=";", )

#Changing the date format to POSIXlt
PWConsumption$Date <- as.Date(PWConsumption$Date, format ="%d/%m/%Y")

#subseting the data to only use the dates 2007-02-01 and 2007-02-02
PWData <- subset(PWConsumption, PWConsumption == "2007-02-01" | PWConsumption =="2007-02-02")

#Creating plot: Global Active power and saving it to Plot1.png and closing off the device
png("Plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(PWData$Global_active_power)), xlab="Global Active Power (kilowatts)", ylab = "Frequency", main ="Global Active Power", col = "red")
dev.off()
