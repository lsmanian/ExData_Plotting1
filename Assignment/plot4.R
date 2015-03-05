#Read with seperator ';' and na strings as '?'
input = read.table('household_power_consumption.txt',sep=';',na.strings='?',header=TRUE)

subset_input$newdate <- apply(subset_input[,c('Date','Time')],1,paste,collapse=" ")

subset_input$newdate <- strptime(subset_input$newdate,"%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width=480,height=480,units='px')
  par(mfrow = c(2,2))
  with(subset_input,plot(newdate,Global_active_power,type="l",xlab="",ylab = "Global Active Power(Kilowatts)"))
  plot(subset_input$newdate,subset_input$Voltage,xlab="datetime",ylab="Voltage",type='l')
  plot(subset_input$newdate,subset_input$Sub_metering_1,type="n",xlab = "",ylab="Energy Sub Metering")
  lines(subset_input$newdate,subset_input$Sub_metering_1,type='l')
  lines(subset_input$newdate,subset_input$Sub_metering_2,type='l',col='red')
  lines(subset_input$newdate,subset_input$Sub_metering_3,type='l',col='blue')
  legend('topright',legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),pch='-',col=c("black","red","blue"),lwd=2)
  plot(subset_input$newdate,subset_input$Global_reactive_power,,xlab="datetime",ylab="Global_Reactive_Power",type='l')
dev.off()
