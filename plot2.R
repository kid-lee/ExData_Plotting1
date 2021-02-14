# Data has been cleaned by clean.R
# See repo for what happened in the script :) 

library(data.table)

# read small Data set
dt <-fread("workingData.csv")

# for some reason, when i clean the data, Itime type do NOT save to the file
# i have t changet the time col to Itime when i run the code. 
# Maybe you know! 

dt[, ("Time") := lapply(.SD, as.ITime), .SDcols = "Time"]

# combine the Date and Time to a DatenTime variable, then add to the data table
dnt <- as.POSIXct(paste(dt$Date,dt$Time), format = "%Y-%m-%d %H:%M:%S")
dt$DnT <- dnt

# plotting with line 
with(dt, plot(DnT,Global_active_power,type = "l",
              ylab = "Global Active power(kilowatts)",
              xlab = ""))

# copy to file
dev.copy(png,"plot2.png")
dev.off()
