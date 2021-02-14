# Data has been cleaned by clean.R
# See repo for what happened in the script :) 

library(data.table)

# read small Data set
dt <-fread("workingData.csv")


# need to make it bigger..
png("plot3.png", width = 600, height = 600)

with(dt,plot(DnT,Sub_metering_1,type = "l",col = "black",xlab = "", ylab = "Energy sub metering"))
with(dt,lines(DnT,Sub_metering_2, col = "red"))
with(dt,lines(DnT,Sub_metering_3, col = "blue"))
legend("topright", pch =1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# copy to file
#dev.copy(png,"plot3.png", width=10, height=10)
dev.off()