#Read with seperator ';' and na strings as '?'
input = read.table('household_power_consumption.txt',sep=';',na.strings='?',header=TRUE)

subset_input$newdate <- apply(subset_input[,c('Date','Time')],1,paste,collapse=" ")

subset_input$newdate <- strptime(subset_input$newdate,"%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480,units='px')
with(subset_input,plot(newdate,Global_active_power,type="l",xlab="",ylab = "Global Active Power(Kilowatts)"))
dev.off()

