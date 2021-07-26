## creates  a line plots of energy sub metering data

powerData<- read.table("G:\\dataScience\\Exploratory Data Analysis\\household_power_consumption.txt.txt",header = TRUE,sep = ";")
dateVec <- as.Date(powerData$Date, format = "%d/%m/%Y")
analysisDates <- c(as.Date("01/02/2007",format="%d/%m/%Y"), as.Date("02/02/2007",format="%d/%m/%Y"))
subsetVec <- (dateVec == analysisDates[1]) | (dateVec == analysisDates[2])

subMetering1<- as.numeric(powerData$Sub_metering_1[subsetVec])
subMetering2<- as.numeric(powerData$Sub_metering_2[subsetVec])
subMetering3<- as.numeric(powerData$Sub_metering_3[subsetVec])
xData <- seq_along(subMetering1)

png(filename = "plot3.png",width = 480, height = 480,units = "px")
plot(xData,subMetering1, ylab = "Energy sub metering", type = "l",xlab="Days",col="black", xaxt="n")
lines(xData,subMetering2,col="blue",type = "l")
lines(xData,subMetering3,col="red",type = "l")
axis(1,at = round(seq(1, length(xData), length.out = 3)), labels = c("Thu","Fri","Sat"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty = c(1,1,1))
dev.off()