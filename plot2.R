Sys.setlocale("LC_TIME","English_United_States")
datasourcefile<-"C:\\Users\\bindalni\\Documents\\household_power_consumption.txt"
maindata<-read.table(datasourcefile,header=TRUE,sep=";",stringsAsFactors = FALSE)
dates<-maindata[maindata$Date %in% c("1/2/2007","2/2/2007"),]
strptimefunction<-strptime(paste(dates$Date,dates$Time,sep=""),"%d/%m/%Y %H:%M:%S")
power_data<-as.numeric(dates$Global_active_power)
png("plot2.png",width=480,height=480)
plot(strptimefunction,power_data,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
