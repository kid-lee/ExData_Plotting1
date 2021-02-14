# read small Data set
dt <-fread("workingData.csv")
# change the column type for later procesising
numnames = c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
intnames = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")


dt[, (numnames) := lapply(.SD, as.numeric), .SDcols = numnames]
dt[, ("Date") := lapply(.SD, as.Date, format ="%d/%m/%y"), .SDcols = "Date"]
dt[, ("Time") := lapply(.SD, as.ITime), .SDcols = "Time"]


# plotting with hist 
with(dt, hist(Global_active_power, 
              main = "Global Active power",
              col = "red",
              xlab = "Global Active power(kilowatts)",
))

# copy to file
dev.copy(png,"plot1.png")
dev.off()