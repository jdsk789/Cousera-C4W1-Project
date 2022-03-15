#read file
hps <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
#format time
hps$Date = as.Date(hps$Date, format = "%d/%m/%Y")
hps$Time = strptime(paste(hps$Date,hps$Time),format = "%Y-%m-%d %H:%M:%S")

#select 2 days of February
hps = hps[hps$Date >= "2007-2-1" & hps$Date <= "2007-2-2",]

png('plot2.png')
plot(hps$Time,hps$Global_active_power, type='l', xlab='',ylab='Global Active Power (kilwatts)', axis(1, at=c(1,1440,2880), labels=c('Thu','Fri','Sat')))
dev.off()