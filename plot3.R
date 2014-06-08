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

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

plot(x=pData$DateTime,y=pData$Sub_metering_1,type="l",
     xlab="",ylab="Energy sub meetering")
lines(x=pData$DateTime,y=pData$Sub_metering_2, type="l",col="red")
lines(x=pData$DateTime,y=pData$Sub_metering_3, type="l",col="blue")
legendTxt <-c("sub Meetering 1","sub Meetering 2", "sub Meetering 3")
legend("topright",c("Sub metering_1","Sub metering_2", "Sub metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))


dev.off()