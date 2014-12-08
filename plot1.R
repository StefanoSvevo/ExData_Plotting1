# Load the file locally and read it into a dataframe
setwd("C:/Stefano/Courses/Coursera Certificate/4_Exploratory Data Analysis/Project1/")
localFile <- "household_power_consumption.txt"
dataframe <- read.table(localFile,sep = ";",header = TRUE,na.strings = c("NA","","?"),stringsAsFactors = FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Get only dates  1/2/2007 and 2/2/2007
condition <- grep(pattern="^[12]/2/2007",x=dataframe$Date)
reduced <- dataframe[condition,]

# Plot
hist(reduced$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")

# Output to png
dev.copy(png,file="plot1.png")
dev.off()
