# Load the file locally and read it into a dataframe
setwd("C:/Stefano/Courses/Coursera Certificate/4_Exploratory Data Analysis/Project1/")
localFile <- "household_power_consumption.txt"
dataframe <- read.table(localFile,sep = ";",header = TRUE,na.strings = c("NA","","?"),stringsAsFactors = FALSE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Get only dates  1/2/2007 and 2/2/2007
condition <- grep(pattern="^[12]/2/2007",x=dataframe$Date)
reduced <- dataframe[condition,]
reduced$DoW<-weekdays(as.Date(reduced$Date,"%d/%m/%Y"))


# Plot
par(mfrow=c(2,2))

plot(reduced$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(reduced$Global_active_power)
plot(reduced$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(reduced$Voltage)
plot(reduced$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(reduced$Sub_metering_1)
lines(reduced$Sub_metering_2,col="red")
lines(reduced$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=0.2)
plot(reduced$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(reduced$Global_reactive_power)



# Output to png
dev.copy(png,file="plot4.png")
dev.off()
