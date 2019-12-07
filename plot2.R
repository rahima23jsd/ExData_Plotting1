# First download the .zip file and move it into the working directory
# Then unzip the .zip file
# unzip("exdata_data_household_power_consumption.zip")
# This results in a .txt file called household_power_consumption.txt
# Read in the test data to figure out what it looks like
# Clear the global environment

rm(list = ls())
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Convert date and time
power$Date <- as.Date(power$Date,format='%d/%m/%Y')
power$fulltime <- paste(power$Date, power$Time) # make a new timestamp variable combining Date and Time variable
power$fulltime <- strptime(power$fulltime, format = "%Y-%m-%d %H:%M:%S")

datadays <- subset(power,Date == "2007-02-01" | Date == "2007-02-02")
datadays$Global_active_power <- as.numeric(as.character(datadays$Global_active_power))

# plot
png(filename = "plot2.png",width = 480, height = 480)
with(datadays, plot(fulltime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()