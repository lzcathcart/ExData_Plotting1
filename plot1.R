library(sqldf)

householdconsump <- read.csv.sql("household_power_consumption.txt", sql = "select 
                                 * from file where Date in('1/2/2007', '2/2/2007')",
                                 header = TRUE, sep = ";")

householdconsump$Date <- as.Date(householdconsump$Date, format = "%d/%m/%Y")

with(householdconsump, hist(Global_active_power,main = "Global Active Power", 
                            xlab = "Global Active Power (kilowatts)", 
                            ylab = "Frequency", col= c("red"))) 

