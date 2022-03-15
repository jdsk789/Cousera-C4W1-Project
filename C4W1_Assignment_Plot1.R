#read file
hps <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
#format time
hps$Date = as.Date(hps$Date, format = "%d/%m/%Y")
hps$Time = strptime(paste(hps$Date,hps$Time),format = "%Y-%m-%d %H:%M:%S")
#select 2 days of February
hps <- hps[hps$Date >= "2007-2-1" & hps$Date <= "2007-2-2",]
png('plot1.png')
hist(hps$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.off()