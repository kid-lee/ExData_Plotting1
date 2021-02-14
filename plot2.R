# I separated the cleaning function to a script called clean.R
# Please check the root dir of the repo 
# for what happened in the script :) 

library(data.table)

# read small Data set
dt <-fread("workingData.csv")

png("plot2.png", width = 600, height = 600)
# plotting with line 
with(dt, plot(DnT,Global_active_power,type = "l",
              ylab = "Global Active power(kilowatts)",
              xlab = ""))

# copy to file
#dev.copy(png,"plot2.png")
dev.off()
