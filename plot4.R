library(readr)
## Read in file into a dataframe called power
power<-read_csv2("household_power_consumption.txt", na=c("","NA", "?"), col_types = "ccccccccc")

## Add some additional columns with the date and time converted into Date/time objects
power$Date1<-as.Date(power$Date, format="%d/%m/%Y")
power$Time1<-strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")

## Coerce columns into the correct format for plotting
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_active_power<-as.numeric(power$Global_active_power)
power$Global_reactive_power<-as.numeric(power$Global_reactive_power)
power$Voltage<-as.numeric(power$Voltage)
power$Global_intensity<-as.numeric(power$Global_intensity)
power$Sub_metering_1<-as.numeric(power$Sub_metering_1)
power$Sub_metering_2<-as.numeric(power$Sub_metering_2)
power$Sub_metering_3<-as.numeric(power$Sub_metering_3)

## Subset the data for the dates we need
power<-subset(power, Date1=="2007-02-01" | Date1=="2007-02-02")

## Create a 2 x 2 plot grid and save into a png file

png("plot4.png", width=480, height = 480)
par(mfcol=c(2,2))

## Add panel 1

plot(power$Time1, power$Global_active_power , xlab="", ylab="Global Active Power", type="n")
lines(power$Time1, power$Global_active_power, type="l")

## Add panel 2
plot(power$Time1, power$Sub_metering_1 , xlab="", ylab="Energy sub metering", type="n")
lines(power$Time1, power$Sub_metering_1, type="l", col="black")
lines(power$Time1, power$Sub_metering_2, type="l", col="red")
lines(power$Time1, power$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

## Add panel 3
plot(power$Time1, power$Voltage , xlab="datetime", ylab="Voltage", type="n")
lines(power$Time1, power$Voltage, type="l", col="black")

## Add panel 4
plot(power$Time1, power$Global_reactive_power , xlab="datetime", ylab="Global_reactive_power", type="n")
lines(power$Time1, power$Global_reactive_power, type="l", col="black")

dev.off()