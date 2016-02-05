
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

## Create the plot and save into a png file
png("plot1.png", width=480, height = 480)
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()