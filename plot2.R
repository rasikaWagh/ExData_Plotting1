## creates  a line plot of global active power

powerData<- read.table("G:\\dataScience\\Exploratory Data Analysis\\household_power_consumption.txt.txt",header = TRUE,sep = ";")
dateVec <- as.Date(powerData$Date, format = "%d/%m/%Y")
analysisDates <- c(as.Date("01/02/2007",format="%d/%m/%Y"), as.Date("02/02/2007",format="%d/%m/%Y"))
subsetVec <- (dateVec == analysisDates[1]) | (dateVec == analysisDates[2])
globalActivePower<- as.numeric(powerData$Global_active_power[subsetVec])
png(filename = "plot2.png",width = 480, height = 480,units = "px")
plot(globalActivePower, ylab = "Global Active Power (kilowatts)", type = "l",xlab="Days",xaxt = "n")
axis(1,at = round(seq(1, length(globalActivePower), length.out = 3)), labels = c("Thu","Fri","Sat"))
dev.off()