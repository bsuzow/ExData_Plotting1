#

dtHPCnet <- SetUpDataTable("household_power_consumption.txt",day_vec= c(1:2))

# create a histogram and save it in the png format.
if (nrow(dtHPCnet)==0) { stop ("No data to report.") }

with(dtHPCnet,hist(Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
dev.copy(png,file="plot1.png")
dev.off()
