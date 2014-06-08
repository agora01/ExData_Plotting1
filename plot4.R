# R Code to do Plot1 from Quiz 1 Coursera Exploratory Data Analysis Course
# By Raul Goycoolea


# Set sqldf Library to do SQL to get only required data
library(sqldf)

# Set working Directory where we have the data to analyze
setwd("Documents/R_Projects/Exploratoty_Data_Analysis/")

# Set the filenmae
file <- "household_power_consumption.txt"

# Do a select query to get the data only form the data range requested
select <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

# Read the CSV file with the Select Query
Data <- read.csv.sql(file, sql=selec, sep=";")

# Read data and set the correct date/time formats

Data$DateTime <- as.POSIXct(strptime(paste(Data$Date,Data$Time), "%d/%m/%Y %H:%M:%S"))

pData <- Data

pData <- getData()

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", 
    bg = "white")
par(mfrow=c(2,2))

#plot 1

#plot 2
plot(pData$DateTime,pData$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

#plot 2
plot(pData$DateTime,pData$Voltage,type="l",
     xlab="datetime",ylab="Voltage")


#plot 3 
plot(x=pData$DateTime,y=pData$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub Meetering")
lines(x=pData$DateTime,y=pData$Sub_metering_2, type="l",col="red")
lines(x=pData$DateTime,y=pData$Sub_metering_3, type="l",col="blue")
legendTxt <-c("Sub Meetering 1","Sub Meetering 2", "Sub Meetering 3")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

#plot 2 again
plot(pData$DateTime,pData$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")

dev.off()