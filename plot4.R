#Loading the dataset into R from the working directory.
ElecPowerCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Conversion of the date/time variables to date/time classes in R using the as.Date() function and strptime() function.
ElecPowerCons$Date <- as.Date(ElecPowerCons$Date, "%d/%m/%Y")
ElecPowerCons$Date_Time <- strptime(paste(ElecPowerCons$Date, ElecPowerCons$Time), "%Y-%m-%d %H:%M:%S")

#Subsetting the data to the period starting 01/02/2007 an ending 02/02/2007.
ElecPowerCons = subset(ElecPowerCons, ElecPowerCons$Date == "2007-02-01"|ElecPowerCons$Date == "2007-02-02" ) 

#Constructing the plot and saving it as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(ElecPowerCons$Date_Time, ElecPowerCons$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(ElecPowerCons$Date_Time, ElecPowerCons$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(ElecPowerCons$Date_Time, ElecPowerCons$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(ElecPowerCons$Date_Time, ElecPowerCons$Sub_metering_2, type = "l", col = "red")
lines(ElecPowerCons$Date_Time, ElecPowerCons$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")
plot(ElecPowerCons$Date_Time, ElecPowerCons$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()