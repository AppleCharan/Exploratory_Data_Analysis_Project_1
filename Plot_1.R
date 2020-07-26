setwd("/Users/Apple/Desktop/Data")
if(!file.exists("./Data"))
{
  dir.create("./Data")
}


fUrl1 <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fUrl1,destfile="./Data/household_power_consumption.zip")
unzip(zipfile="./Data/household_power_consumption.zip",exdir="./Data")
setwd("/Users/Apple/Desktop/Data")

Elc_Pwr_Cons <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Elc_Pwr_Cons) <- c("Date","Time","Global_active_power",
						"Global_reactive_power","Voltage","Global_intensity",
						"Sub_metering_1","Sub_metering_2","Sub_metering_3"
)
Sub_Elc_Pwr_Cons <- subset(Elc_Pwr_Cons,Elc_Pwr_Cons$Date=="1/2/2007" |
					 	Elc_Pwr_Cons$Date =="2/2/2007"
)

hist(as.numeric(as.character(Sub_Elc_Pwr_Cons$Global_active_power)),
						col="red",
						main="Global Active Power",
						xlab="Global Active Power(kilowatts)"
)

title(main="Global Active Power")

dev.copy(png, filename="Plot_1.png")
dev.off()