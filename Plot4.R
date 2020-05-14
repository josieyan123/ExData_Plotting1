household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";") ##read dataset into R session
usefuldata <- household_power_consumption[66637:69516, ] ##subset the data for 2017-02-01 & 2017-02-02

##convert Date & Time variables to Date/Time class in R using lubridate package
library(lubridate)  
usefuldata$Date = dmy(usefuldata$Date)  
usefuldata$Time = strptime(usefuldata$Time, format = "%H:%M:%S")

png(file = "plot4.png")  #give the plot a name 
par(mfrow = c(2,2))  #set the screen to have 2 rows and 2 columns of plots 

#plot the topleft corner graph 
usefuldata$Global_active_power = as.character(usefuldata$Global_active_power)
plot(usefuldata$Date, usefuldata$Global_active_power, type = "o", col = "black", ylab = "Global Active Power(Kilowatts)", xlab = "Day", ylim = c(0,6))

#plot the topright corner graph  
plot(usefuldata$Date, usefuldata$Voltage, type = "o", xlab = "datetime", ylab = "Voltage")

#plot the bottom left corner graph 
plot(y[,1],ylim=c(0,30),col="black",lty=1,ylab="Energy sub metering",lwd=2,xlab="Date",xaxt="n")
lines(y[,2],col="red",lty=1,lwd=2)
lines(y[,3],col="blue",lty=1,lwd=2)
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot the bottom right corner graph 
plot(usefuldata$Date, usefuldata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")

dev.off() #save the file


