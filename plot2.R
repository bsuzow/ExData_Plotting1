# reading the power consumption data file and load it to a data table.
dtHPCnet <- SetUpDataTable("household_power_consumption.txt",day_vec= c(1:2))

# drawing a line plot
with(dtHPCnet,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(dtHPCnet,lines(DateTime,Global_active_power))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
