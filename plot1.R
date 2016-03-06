#Dates needed : 2007-02-01 and 2007-02-02
dates<-c('1/2/2007','2/2/2007')
cols<-c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric')
data<-read.table(unz('household_power_consumption.zip','household_power_consumption.txt'),sep=';',header = TRUE, stringsAsFactors = FALSE)
data2<-data[data$Date %in% dates,]
data_withNA<-as.data.frame(apply(data2,2,function(x) replace(x,"?" %in% x,NA)),col)
##Histogram of Global Active Power
png('plot1.png')
data_withNA$Global_active_power<-as.numeric(data_withNA$Global_active_power)
hist(data_withNA$Global_active_power,col="red", main = "Global Active Power",xlab = "Global Active Power (in kilowatts)")
dev.off()