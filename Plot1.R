household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";") ##read dataset into R session
usefuldata <- household_power_consumption[66637:69516, ] ##subset the data for 2017-02-01 & 2017-02-02

##convert Date & Time variables to Date/Time class in R using lubridate package
library(lubridate)  
usefuldata$Date = dmy(usefuldata$Date)  
usefuldata$Time = strptime(usefuldata$Time, format = "%H:%M:%S")

library(datasets)
counts <- table(usefuldata$Global_active_power)  ##subsetting data for the graph 
png(file = "plot1.png")  ##give the plot a name 

##plotting the graph
hist(counts, xlab = "Global Active Power(Kilowatts)", ylab = "Frequency", col = "red", xlim = c(0,6), luylim = c(0,1200), main = "Global Active Power")

##save the file 
dev.off()