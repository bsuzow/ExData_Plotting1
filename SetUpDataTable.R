SetUpDataTable <- function(fname,delimiter=";",nachar="?",mth=2,day_vec=c(1:2), yr=2007) {

  library(data.table)
  library(dplyr)

  # This script assumes that the data file is available in the working directory.
  # The assumptions about the data file:
  #    The original file has been downsized to contain the full data just for Feb 2007.
  #    Colume names: "Date","Time","Global_active_power","Global_reactive_power","Voltage",
  #                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"

  if (!file.exists(fname)) {
     stop(paste(fname," does not exist."))
     dt <- data.frame()
  }
  
  # read.csv loaded the colume names based on line 1
  dt<- as.data.table(read.csv(fname,sep=delimiter, na.strings=nachar))
  
  # as.POSIXlt returned an error -- DateTime is unsupported class POSIXlt.  Changed it to POSIXct
  dt <- dt %>% mutate(DateTime = as.POSIXct(
                 paste(as.character(Date),as.character(Time),sep=" "),format="%d/%m/%Y %H:%M:%S"))
  
  # add the weekday column
  
  wdayvec <- c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
  dt <- dt %>% mutate(Wkday = substr(weekdays(DateTime),1,3))
  
  # extract the rows pertinent to two days via the mth and day_vec arguments
  dtNet <- dt %>% filter(month(DateTime)==mth & mday(DateTime) %in% day_vec & year(DateTime)==yr)

}