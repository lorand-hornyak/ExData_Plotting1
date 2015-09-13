## Read all the data from txt file
    d <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## Create a subset for relevant rows of the data set
    dp <- d[(d$Date=="1/2/2007" | d$Date=="2/2/2007" ), ]

## Convert first column to Date and second column to Datetime class
    dp$Date <- as.Date(dp$Date , "%d/%m/%Y")
    dp$Time <- paste(dp$Date, dp$Time, sep=" ")
    dp$Time <- strptime(dp$Time, "%Y-%m-%d %H:%M:%S")

## Generating plot to monitor device
    hist(dp$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    
## Create png file by copying plot from monitor to file device
    dev.copy(png, file="plot1.png", height=480, width=480)
    dev.off()