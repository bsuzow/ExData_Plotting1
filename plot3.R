# reading the power consumption data file and load it to a data table.
dtHPCnet <- SetUpDataTable("household_power_consumption.txt",day_vec= c(1:2))

# drawing a line plot comparing 3 metering variables.
# seting the y-axis limit to the max value of the 3 metering variables.
with(dtHPCnet,plot(DateTime,Global_active_power,type="n",xlab="",ylab="Engery sub metering",
                   ylim=c(0,max(max(Sub_metering_1),max(Sub_metering_2),max(Sub_metering_3)))
                   ))
with(dtHPCnet,lines(DateTime,Sub_metering_1))
with(dtHPCnet,lines(DateTime,Sub_metering_2, col="red"))
with(dtHPCnet,lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",lty=1, col = c("black","blue", "red"), 
                   legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()

