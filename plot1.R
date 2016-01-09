datasourcefile<-"C:\\Users\\bindalni\\Documents\\household_power_consumption.txt"
maindata<-read.table(datasourcefile,header=TRUE,sep=";",stringsAsFactors = FALSE)
dates<-maindata[maindata$Date %in% c("1/2/2007","2/2/2007"),]
power_data<-as.numeric(dates$Global_active_power)
png("plot1.png",width=480,height=480)
hist(power_data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
