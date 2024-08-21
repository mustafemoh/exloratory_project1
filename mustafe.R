#PLOT1

#Set working directory

setwd("H:/My Drive/Data Science Diploma/4 EDA")


#read txt file

HHpowercon <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)

#Change classes of Date and Time variables
HHpowercon$Date <- as.Date(HHpowercon$Date, format = "%d/%m/%Y")
HHpowercon$DateTime <- strptime(paste(HHpowercon$Date,HHpowercon$Time),
                                format = "%Y-%m-%d %H:%M:%S")

#Choose data from "2007-2-1" to "2007-2-2"
HHpowercon <- HHpowercon[HHpowercon$Date >= "2007-2-1" & HHpowercon$Date <= "2007-2-2",]

#plot 1

#calling the basic plot function
hist(as.numeric(as.character(HHpowercon$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

#copying to png
dev.copy(png, filename="1plot1.png")
dev.off()



##Plot 2

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
HHpowercon$Date <- as.Date(HHpowercon$Date, format="%d/%m/%Y")
HHpowercon$Time <- strptime(HHpowercon$Time, format="%H:%M:%S")
HHpowercon[1:1440,"Time"] <- format(HHpowercon[1:1440,"Time"],"2007-02-01 %H:%M:%S")
HHpowercon[1441:2880,"Time"] <- format(HHpowercon[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(HHpowercon$Time,as.numeric(as.character(HHpowercon$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

#copying to png
dev.copy(png, filename="1plot2.png")
dev.off()

##Plot3

# calling the basic plot functions
plot(HHpowercon$Time,HHpowercon$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(HHpowercon,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(HHpowercon,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(HHpowercon,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

#copying to png
dev.copy(png, filename="1plot3.png")
dev.off()


#Plot4

# initiating a composite plot with many graphs
par(mfrow=c(2,2))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(HHpowercon,{
  plot(HHpowercon$Time,as.numeric(as.character(HHpowercon$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(HHpowercon$Time,as.numeric(as.character(HHpowercon$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(HHpowercon$Time,HHpowercon$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(HHpowercon,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(HHpowercon,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(HHpowercon,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(HHpowercon$Time,as.numeric(as.character(HHpowercon$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#copying to png
dev.copy(png, filename="1plot4.png")
dev.off()

