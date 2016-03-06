#Dates needed : 2007-02-01 and 2007-02-02
dates<-c('1/2/2007','2/2/2007')
data<-read.table(unz('household_power_consumption.zip','household_power_consumption.txt'),sep=';',header = TRUE, stringsAsFactors = FALSE)
data2<-data[data$Date %in% dates,]
data_withNA<-as.data.frame(apply(data2,2,function(x) replace(x,"?" %in% x,NA)),col)
##Multiplot
png('plot4.png')
par(mfrow=c(2,2))
#(1,1) Global Active Power
data_withNA$Global_active_power<-as.numeric(data_withNA$Global_active_power)
plot(data_withNA$Global_active_power,type = 'l',xaxt='n',xlab='',ylab='Global Active Power')
axis(side=1, at=c(1,1441,2880), labels = c('Thu','Fri','Sat'))
#(1,2) Voltage
data_withNA$Voltage<-as.numeric(data_withNA$Voltage)
plot(data_withNA$Voltage,type = 'l',xaxt='n',xlab='',ylab='Voltage')
axis(side=1, at=c(1,1441,2880), labels = c('Thu','Fri','Sat'))
#(2,1) Submetering
data_withNA$Sub_metering_1<-as.numeric(data_withNA$Sub_metering_1)
data_withNA$Sub_metering_2<-as.numeric(data_withNA$Sub_metering_2)
data_withNA$Sub_metering_3<-as.numeric(data_withNA$Sub_metering_3)
plot(data_withNA$Sub_metering_1,type = 'l',col='black', ylim=c(0,20), xaxt='n',xlab='',yaxt='n',ylab='Energy Sub metering')
par(new=TRUE)
plot(data_withNA$Sub_metering_2,type = 'l',col='red',ylim=c(0,20), xaxt='n',xlab='',yaxt='n',ylab='')
par(new=TRUE)
plot(data_withNA$Sub_metering_3,type = 'l',col='blue',ylim=c(0,20), xaxt='n',xlab='',yaxt='n',ylab='')
axis(side=1, at=c(1,1441,2880), labels = c('Thu','Fri','Sat'))
axis(side=2, at=c(0,5,10,15,20,25), labels = c(0,5,10,15,20,25))
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),bty='n')
#(2,2) Global Reactive Power
data_withNA$Global_reactive_power<-as.numeric(data_withNA$Global_reactive_power)
plot(data_withNA$Global_reactive_power,type = 'l',xaxt='n',xlab='',ylab='Global Active Power')
axis(side=1, at=c(1,1441,2880), labels = c('Thu','Fri','Sat'))
dev.off()