#Read with seperator ';' and na strings as '?'
input = read.table('household_power_consumption.txt',sep=';',na.strings='?',header=TRUE)
subset_input <- subset(input,(Date %in% c('1/2/2007','2/2/2007')))
subset_input$newdate <- apply(subset_input[,c('Date','Time')],1,paste,collapse=" ")

subset_input$newdate <- strptime(subset_input$newdate,"%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",width=480,height=480,units='px')
plot(subset_input$newdate,subset_input$Sub_metering_1,type="n",xlab = "",ylab="Energy Sub Metering")
lines(subset_input$newdate,subset_input$Sub_metering_1,type='l')
lines(subset_input$newdate,subset_input$Sub_metering_2,type='l',col='red')
lines(subset_input$newdate,subset_input$Sub_metering_3,type='l',col='blue')
legend('topright',legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),pch='-',col=c("black","red","blue"),lwd=2)
dev.off()

