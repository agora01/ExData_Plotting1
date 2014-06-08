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

lim <- c(0,1200)

# Set an output PNG File with the requested size

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    bg = "white")

# Set the graph parameters

hist(pData$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (killowats)",col="red",ylim=lim)
dev.off()

# Done
