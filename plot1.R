
# Data has been cleaned by clean.R
# See repo for what happened in the script :) 

library(data.table)
# read small Data set
dt <-fread("workingData.csv")

# need to make it bigger..
png("plot1.png", width = 600, height = 600)
# plotting with hist 
with(dt, hist(Global_active_power, 
              main = "Global Active power",
              col = "red",
              xlab = "Global Active power(kilowatts)"))

# copy to file
#dev.copy(png,"plot1.png")
dev.off()
