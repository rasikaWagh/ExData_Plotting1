## creates a 4 plots of global active power, voltage, energy sub metering and global reactive power

powerData<- read.table("G:\\dataScience\\Exploratory Data Analysis\\household_power_consumption.txt.txt",header = TRUE,sep = ";")
dateVec <- as.Date(powerData$Date, format = "%d/%m/%Y")
analysisDates <- c(as.Date("01/02/2007",format="%d/%m/%Y"), as.Date("02/02/2007",format="%d/%m/%Y"))
subsetVec <- (dateVec == analysisDates[1]) | (dateVec == analysisDates[2])

# get the data for plots 

globalActivePower<- as.numeric(powerData$Global_active_power[subsetVec])
voltage<- as.numeric(powerData$Voltage[subsetVec])
globalReactivePower <- as.numeric(powerData$Global_reactive_power[subsetVec])
subMetering1<- as.numeric(powerData$Sub_metering_1[subsetVec])
subMetering2<- as.numeric(powerData$Sub_metering_2[subsetVec])
subMetering3<- as.numeric(powerData$Sub_metering_3[subsetVec])
xData <- seq_along(subMetering1)

# create a plot with 4 subplots 
png(filename = "plot4.png",width = 480, height = 480,units = "px")
par(mfrow = c(2,2), mfcol = c(2,2), mar= c(4,4,2,1))

plot(globalActivePower, ylab = "Global Active Power (kilowatts)", type = "l",xlab="Datetime",xaxt = "n")
axis(1,at = round(seq(1, length(xData), length.out = 3)), labels = c("Thu","Fri","Sat"))

plot(xData,subMetering1, ylab = "Energy sub metering", type = "l",xlab="Datetime",col="black", xaxt="n")
lines(xData,subMetering2,col="blue",type = "l")
lines(xData,subMetering3,col="red",type = "l")
axis(1,at = round(seq(1, length(xData), length.out = 3)), labels = c("Thu","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty = c(1,1,1))

plot(xData, voltage, ylab = "Voltage", type = "l",xlab="Datetime",xaxt = "n")
axis(1,at = round(seq(1, length(xData), length.out = 3)), labels = c("Thu","Fri","Sat"))

plot(xData,globalReactivePower, ylab = "Global Reactive Power (kilowatts)", type = "l",xlab="Datetime",xaxt = "n")
axis(1,at = round(seq(1, length(xData), length.out = 3)), labels = c("Thu","Fri","Sat"))

dev.off()