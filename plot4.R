library(sqldf)

householdconsump <- read.csv.sql("household_power_consumption.txt", sql = "select 
                                 * from file where Date in('1/2/2007', '2/2/2007')",
                                 header = TRUE, sep = ";")

householdconsump$Date <- as.Date(householdconsump$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(householdconsump$Date), householdconsump$Time)

householdconsump$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))

with(householdconsump, plot(householdconsump$Datetime, householdconsump$Global_active_power, 
                            type = "l", xlab = "", ylab = "Global Active Power"))

with(householdconsump, plot(householdconsump$Datetime, householdconsump$Voltage, 
                            type = "l", xlab = "datetime", ylab = "Voltage"))

with(householdconsump, {plot(householdconsump$Datetime, householdconsump$Sub_metering_1, 
                             type = "l", xlab = "", ylab = "Energy sub metering") 
        lines(householdconsump$Datetime, householdconsump$Sub_metering_2, col= 'Red')
        lines(householdconsump$Datetime, householdconsump$Sub_metering_3, col= 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty =1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(householdconsump, plot(householdconsump$Datetime, householdconsump$Global_reactive_power, 
                            type = "l", xlab = "datetime", ylab = "Global_reactive_power"))





