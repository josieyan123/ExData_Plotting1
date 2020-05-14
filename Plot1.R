household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";") ##read dataset into R session

##subset the data for 2007-02-01 & 2007-02-02
usefuldata <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007") 


##convert Date & Time variables to Date/Time class in R using lubridate package
library(lubridate)  
usefuldata$Date = dmy(usefuldata$Date)  
usefuldata$Time = strptime(usefuldata$Time, format = "%H:%M:%S")

png(file = "plot1.png")  ##give the plot a name 

##plotting the graph
hist(as.numeric(as.character(usefuldata$Global_active_power)), xlab = "Global Active Power(Kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

##save the file 
dev.off()
