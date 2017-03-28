setwd("~/exploratory_data_analysis_pa1/")
dataset <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c(NA,"?"))
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02", ]
png("plot1.png", width = 480, height = 480, units = "px")
par(bg = NA) #to make the background transparent rather than white!
with(dataset, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
