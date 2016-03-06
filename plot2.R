#Dates needed : 2007-02-01 and 2007-02-02
dates<-c('1/2/2007','2/2/2007')
data<-read.table(unz('household_power_consumption.zip','household_power_consumption.txt'),sep=';',header = TRUE, stringsAsFactors = FALSE)
data2<-data[data$Date %in% dates,]
data_withNA<-as.data.frame(apply(data2,2,function(x) replace(x,"?" %in% x,NA)),col)
##line plot of Global Active power over time
png('plot2.png')
data_withNA$Global_active_power<-as.numeric(data_withNA$Global_active_power)
plot(data_withNA$Global_active_power,type = 'l',xaxt='n',xlab='',ylab='Global Active Power (in kilowatts)')
axis(side=1, at=c(1,1441,2880), labels = c('Thu','Fri','Sat'))
dev.off()