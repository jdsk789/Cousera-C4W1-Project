#read file
hps <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#format time
hps$Date = as.Date(hps$Date, format = "%d/%m/%Y")
hps$Time = strptime(paste(hps$Date,hps$Time),format = "%Y-%m-%d %H:%M:%S")

#select 2 days of February
hps = hps[hps$Date >= "2007-2-1" & hps$Date <= "2007-2-2",]

png('plot3.png')
plot(hps$Time, hps$Sub_metering_1, type='l',xlab='',ylab='Energy Sub Metering')
lines(hps$Time, hps$Sub_metering_2, col='red')
lines(hps$Time, hps$Sub_metering_3, col='blue')
legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()