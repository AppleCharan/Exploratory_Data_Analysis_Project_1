setwd("/Users/Apple/Desktop/Data")
Elc_Pwr_Cons <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Elc_Pwr_Cons) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Sub_Elc_Pwr_Cons <- subset(Elc_Pwr_Cons,Elc_Pwr_Cons$Date=="1/2/2007" | Elc_Pwr_Cons$Date =="2/2/2007")

Sub_Elc_Pwr_Cons$Date <- as.Date(Sub_Elc_Pwr_Cons$Date, format="%d/%m/%Y")
Sub_Elc_Pwr_Cons$Time <- strptime(Sub_Elc_Pwr_Cons$Time, format="%H:%M:%S")
Sub_Elc_Pwr_Cons[1:1440,"Time"] <- format(Sub_Elc_Pwr_Cons[1:1440,"Time"],"2007-02-01 %H:%M:%S")
Sub_Elc_Pwr_Cons[1441:2880,"Time"] <- format(Sub_Elc_Pwr_Cons[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


par(mfrow=c(2,2))

with(Sub_Elc_Pwr_Cons,{
  plot(Sub_Elc_Pwr_Cons$Time,as.numeric(as.character(Sub_Elc_Pwr_Cons$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(Sub_Elc_Pwr_Cons$Time,as.numeric(as.character(Sub_Elc_Pwr_Cons$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(Sub_Elc_Pwr_Cons$Time,Sub_Elc_Pwr_Cons$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(Sub_Elc_Pwr_Cons,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(Sub_Elc_Pwr_Cons,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(Sub_Elc_Pwr_Cons,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(Sub_Elc_Pwr_Cons$Time,as.numeric(as.character(Sub_Elc_Pwr_Cons$Global_reactive_power)),type="l",xlab="datetime",ylab="Global reactive power")
})

dev.copy(png, filename="Plot_4.png")
dev.off()