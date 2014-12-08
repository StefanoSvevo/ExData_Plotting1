# Load the file locally and read it into a dataframe
setwd("C:/Stefano/Courses/Coursera Certificate/4_Exploratory Data Analysis/Project1/")
localFile <- "household_power_consumption.txt"
dataframe <- read.table(localFile,sep = ";",header = TRUE,na.strings = c("NA","","?"),stringsAsFactors = FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Get only dates  1/2/2007 and 2/2/2007
condition <- grep(pattern="^[12]/2/2007",x=dataframe$Date)
reduced <- dataframe[condition,]
reduced$DoW<-weekdays(as.Date(reduced$Date,"%d/%m/%Y"))


# Plot
plot(reduced$Sub_metering_1,type="n",ylab="Energy sub metering")
lines(reduced$Sub_metering_1)
lines(reduced$Sub_metering_2,col="red")
lines(reduced$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.5)

# Output to png
dev.copy(png,file="plot3.png")
dev.off()
