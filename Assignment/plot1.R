#Read with seperator ';' and na strings as '?'

input = read.table('household_power_consumption.txt',sep=';',na.strings='?',header=TRUE)

# subset the input based on date range between 1,2 Feb 2007 
subset_input <- subset(input,(Date %in% c('2/1/2007','2/2/2007')))

#plot histogram of Active power consumption in kilowatts and frequency (Homes
png(filename="plot1.png",width=480,height=480,units='px')
hist(subset_input$Global_active_power,col='red',xlab = "Global Active Power(Kilowatts)")
dev.off()
