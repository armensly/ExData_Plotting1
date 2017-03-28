setwd("~/exploratory_data_analysis_pa1/")
dataset <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c(NA,"?"))
dataset$datetime <- paste(dataset$Date, dataset$Time)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset <- dataset[dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02", ]
dataset$datetime <- strptime(dataset$datetime, "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(dataset, {
        plot(datetime, Global_active_power, "n", ylab = "Global Active Power", xlab = NA, )
        lines(datetime, Global_active_power)
})
with(dataset, {
        plot(datetime, Voltage, "n")
        lines(datetime, Voltage)
})
with(dataset, {
        plot(datetime, Sub_metering_1, "n", ylab = "Energy sub metering", xlab = NA)
        lines(datetime, Sub_metering_1, col = "black")
        lines(datetime, Sub_metering_2, col = "red")
        lines(datetime, Sub_metering_3, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, box.col = NA)
})
with(dataset, {
        plot(datetime, Global_reactive_power, "n")
        lines(dataset$datetime, dataset$Global_reactive_power)
})
dev.off()