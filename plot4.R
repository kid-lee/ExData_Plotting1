# Data has been cleaned by clean.R
# See repo for what happened in the script :) 

library(data.table)

# read small Data set
dt <-fread("workingData.csv")
# size the png and define margin 
png("plot4.png", width = 800, height = 800)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

#copy plots from previous assignements ..... 

with(dt, {
  
  # datetime -- Global_active_power
  plot(DnT,Global_active_power,type = "l",
       ylab = "Global Active power(kilowatts)",
       xlab = "")
  
  # datetime -- Voltage
  plot(DnT,Voltage,type = "l",
       ylab = "Voltage",
       xlab = "datetime")
  
  # Sub_metering
  plot(DnT,Sub_metering_1,type = "l",col = "black",xlab = "", ylab = "Energy sub metering")
  lines(DnT,Sub_metering_2, col = "red")
  lines(DnT,Sub_metering_3, col = "blue")
  legend("topright", pch =1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #datetime Global_reactive_power 
  plot(DnT,Global_reactive_power,type = "l",
       ylab = "Global_reactive_power",
       xlab = "datetime")
  
  #mtext("ozone and weahter", outer = T)
}

)

dev.off()