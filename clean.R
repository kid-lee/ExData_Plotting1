
# Clean the data, change the data type from Char to Date, time, num 
# save the subset to a separate file for later processing

library(data.table)
library(sqldf)

# define start date or end date, you can mod the range of date here, and re-gen the dataset
sdate <- as.Date("01/02/2007",format ="%d/%m/%Y")
edate <- as.Date("02/02/2007",format ="%d/%m/%Y")

numnames = c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# read and subset the data with sdata, and edate
df=fread("household_power_consumption.txt",na.strings="?")

# change char to IDate and Itime type for later processing
df<- df[, ("Date") := lapply(.SD, as.Date, format ="%d/%m/%Y"), .SDcols = "Date"]
df<-df[, ("Time") := lapply(.SD, as.ITime), .SDcols = "Time"]

#subsetting data, save the usefule bit
dt <- subset(df, df$Date %between% c(sdate,edate))

#set numnames to be numeric for later works 
dt<- dt[, (numnames) := lapply(.SD, as.numeric), .SDcols = numnames]
dt<-dt[complete.cases(dt),]


# combine the Date and Time to a DatenTime variable, then add to the data table
dnt <- as.POSIXct(paste(dt$Date,dt$Time), format = "%Y-%m-%d %H:%M:%S")
dt$DnT <- dnt

# create a smaller text file to work on 
fwrite(dt,"workingData.csv")
