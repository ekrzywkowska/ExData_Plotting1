#Assumimg that memory required load the dataset into R can be calculated using the formula:
# memory requred = number of columns * number of rows * 8 bytes
# memory to load Electric Power Consumption = 2,075,259 * 9 * 8 = 149,418,648 bytes ~ 142.5 MB

# 1. Load data into R
setwd("~/exdata_data_household_power_consumption")
Power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?", stringsAsFactors = FALSE)

data = Power[Power$Date %in% c("1/2/2007","2/2/2007"),]

dev.new(width = 480, height = 480, unit = "px", noRStudioGD = TRUE)
hist(data$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")

dev.off()
