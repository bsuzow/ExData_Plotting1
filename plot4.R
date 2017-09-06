# reading the power consumption data file and load it to a data table.
dtHPCnet <- SetUpDataTable("household_power_consumption.txt",day_vec= c(1:2))


# setting a 2 x 2 canvas for 4 plots
par(mfcol = c(2, 2))

#----------------------------
# plot 1: Global Active Power
#----------------------------

with(dtHPCnet,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(dtHPCnet,lines(DateTime,Global_active_power))

#---------------------------------------
# plot 2: Energy sub metering comparison
#---------------------------------------

# setting the y-axis limit to the max value of the 3 metering variables.
with(dtHPCnet,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Engery sub metering",
                   ylim=c(0,max(max(Sub_metering_1),max(Sub_metering_2),max(Sub_metering_3)))
))
with(dtHPCnet,lines(DateTime,Sub_metering_1))
with(dtHPCnet,lines(DateTime,Sub_metering_2, col="red"))
with(dtHPCnet,lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",lty=1, col = c("black","blue", "red"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#---------------------------------------
# plot 3: Voltage
#---------------------------------------

with(dtHPCnet,plot(DateTime,Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(dtHPCnet,lines(DateTime,Voltage))

#---------------------------------------
# plot 4: Global reactive power
#---------------------------------------

with(dtHPCnet,plot(DateTime,Global_reactive_power,type="n",xlab="datetime",
                   ylim=c(0,max(Global_reactive_power))))
with(dtHPCnet,lines(DateTime,Global_reactive_power))

dev.copy(png,file="plot4.png")
dev.off()

