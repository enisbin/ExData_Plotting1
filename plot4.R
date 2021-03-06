Sys.setlocale("LC_TIME","English_United_States")
datasourcefile<-"C:\\Users\\bindalni\\Documents\\household_power_consumption.txt"
maindata<-read.table(datasourcefile,header=TRUE,sep=";",stringsAsFactors = FALSE)
dates<-maindata[maindata$Date %in% c("1/2/2007","2/2/2007"),]
strptimefunction<-strptime(paste(dates$Date,dates$Time,sep=""),"%d/%m/%Y %H:%M:%S")
power_data<-as.numeric(dates$Global_active_power)
reactive_data<-as.numeric(dates$Global_reactive_power)
volt<-as.numeric(dates$Voltage)
meter1<-as.numeric(dates$Sub_metering_1)
meter2<-as.numeric(dates$Sub_metering_2)
meter3<-as.numeric(dates$Sub_metering_3)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(strptimefunction,power_data,type="l",ylab = "Global Active Power",xlab="",cex=0.2)
plot(strptimefunction,volt,type="l",xlab = "datetime",ylab="Voltage")
plot(strptimefunction, meter1, type="l", ylab="Energy sub metering", xlab="")
lines(strptimefunction, meter2, type="l", col="red")
lines(strptimefunction, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty = "o")
plot(strptimefunction,reactive_data,type="l",xlab = "datetime",ylab="Global_reactive_power")
dev.off()
