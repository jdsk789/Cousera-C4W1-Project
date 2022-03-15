#read file
hps <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#format time
hps$Date = as.Date(hps$Date, format = "%d/%m/%Y")
hps$Time = strptime(paste(hps$Date,hps$Time),format = "%Y-%m-%d %H:%M:%S")

#select 2 days of February
hps = hps[hps$Date >= "2007-2-1" & hps$Date <= "2007-2-2",]

#create matrix for graph
png('plot4.png')
par(mfrow=c(2,2))
with(hps, {
  plot(hps$Time,hps$Global_active_power, type='l', xlab='',ylab='Global Active Power (kilwatts)')
  plot(hps$Time,hps$Voltage,type='l', xlab='datetime',ylab='Voltage')
  plot(hps$Time, hps$Sub_metering_1, type='l',xlab='',ylab='Energy Sub Metering')
  lines(hps$Time, hps$Sub_metering_2, col='red')
  lines(hps$Time, hps$Sub_metering_3, col='blue')
  legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(hps$Time, hps$Global_reactive_power,type='l')})
dev.off()