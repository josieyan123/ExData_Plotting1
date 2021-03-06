household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";") ##read dataset into R session

##subset the data for 2007-02-01 & 2007-02-02
usefuldata <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007")

##convert Date & Time variables to Date/Time class in R using lubridate package
usefuldata$Date = as.Date(usefuldata$Date, format="%d/%m/%Y")
usefuldata$Time = strptime(usefuldata$Time, format="%H:%M:%S")
usefuldata[1:1440,"Time"] = format(usefuldata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
usefuldata[1441:2880,"Time"] = format(usefuldata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(file = "plot3.png")  #give the plot a name 
plot(usefuldata$Time,usefuldata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(usefuldata, lines(usefuldata$Time,as.numeric(as.character(Sub_metering_1))))
with(usefuldata,lines(usefuldata$Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(usefuldata, lines(usefuldata$Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off() #save the file

