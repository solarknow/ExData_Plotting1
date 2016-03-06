#Dates needed : 2007-02-01 and 2007-02-02
dates<-c('1/2/2007','2/2/2007')
data<-read.table(unz('household_power_consumption.zip','household_power_consumption.txt'),sep=';',header = TRUE, stringsAsFactors = FALSE)
data2<-data[data$Date %in% dates,]
data_withNA<-as.data.frame(apply(data2,2,function(x) replace(x,"?" %in% x,NA)),col)
##Submetering line plot
png('plot3.png')
data_withNA$Sub_metering_1<-as.numeric(data_withNA$Sub_metering_1)
data_withNA$Sub_metering_2<-as.numeric(data_withNA$Sub_metering_2)
data_withNA$Sub_metering_3<-as.numeric(data_withNA$Sub_metering_3)
plot(data_withNA$Sub_metering_1,type = 'l',col='black', ylim=c(0,15), xaxt='n',xlab='',yaxt='n',ylab='Energy Sub metering')
par(new=TRUE)
plot(data_withNA$Sub_metering_2,type = 'l',col='red',ylim=c(0,15), xaxt='n',xlab='',yaxt='n',ylab='')
par(new=TRUE)
plot(data_withNA$Sub_metering_3,type = 'l',col='blue',ylim=c(0,15), xaxt='n',xlab='',yaxt='n',ylab='')
axis(side=1, at=c(1,1441,2880), labels = c('Thu','Fri','Sat'))
axis(side=2, at=c(0,5,10,15), labels = c(0,5,10,15))
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1))
dev.off()