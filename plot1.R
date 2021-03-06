#Loading the dataset into R from the working directory.
ElecPowerCons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Conversion of the date/time variables to date/time classes in R using the as.Date() function and strptime() function.
ElecPowerCons$Date <- as.Date(ElecPowerCons$Date, "%d/%m/%Y")
ElecPowerCons$Date_Time <- strptime(paste(ElecPowerCons$Date, ElecPowerCons$Time), "%Y-%m-%d %H:%M:%S")

#Subsetting the data to the period starting 01/02/2007 an ending 02/02/2007.
ElecPowerCons = subset(ElecPowerCons, ElecPowerCons$Date == "2007-02-01"|ElecPowerCons$Date == "2007-02-02" ) 

#Constructing the histogram plot and saving it as a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename = "plot1.png", width = 480,height = 480)
hist(ElecPowerCons$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col ="red"  )
dev.off()
