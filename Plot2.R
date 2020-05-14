household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";") ##read dataset into R session
usefuldata <- household_power_consumption[66637:69516, ] ##subset the data for 2017-02-01 & 2017-02-02

##convert Date & Time variables to Date/Time class in R using lubridate package
library(lubridate)  
usefuldata$Date = dmy(usefuldata$Date)  
usefuldata$Time = strptime(usefuldata$Time, format = "%H:%M:%S")

library(datasets)
counts <- table(usefuldata$Global_active_power)  ##subsetting data for the graph 
png(file = "plot2.png")  ##give the plot a name 

usefuldata$Global_active_power = as.character(usefuldata$Global_active_power)
plot(usefuldata$Date, usefuldata$Global_active_power, type = "o", col = "black", ylab = "Global Active Power(Kilowatts)", xlab = "Day", ylim = c(0,6))

dev.off() #save the file 