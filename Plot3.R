#Assumimg that memory required load the dataset into R can be calculated using the formula:
# memory requred = number of columns * number of rows * 8 bytes
# memory to load Electric Power Consumption = 2,075,259 * 9 * 8 = 149,418,648 bytes ~ 142.5 MB

# 1. Load data into R
setwd("~/exdata_data_household_power_consumption")
Power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", dec =".", stringsAsFactors = FALSE)

data = Power[Power$Date %in% c("1/2/2007","2/2/2007"),]
data$datetime = strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# 2. Make a plot
dev.new(width = 480, height = 480, unit = "px", noRStudioGD = TRUE)
plot(data$datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(data$datetime, data$Sub_metering_2, type="l", col ="red")
lines(data$datetime, data$Sub_metering_3, type="l", col ="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col = c("black","red","blue"))
dev.copy(png, file = "plot3.png")

dev.off()
