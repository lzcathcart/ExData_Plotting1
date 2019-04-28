library(sqldf)

householdconsump <- read.csv.sql("household_power_consumption.txt", sql = "select 
                                 * from file where Date in('1/2/2007', '2/2/2007')",
                                 header = TRUE, sep = ";")

householdconsump$Date <- as.Date(householdconsump$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(householdconsump$Date), householdconsump$Time)

householdconsump$Datetime <- as.POSIXct(datetime)


with(householdconsump, plot(householdconsump$Datetime, householdconsump$Global_active_power, 
                            type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
 