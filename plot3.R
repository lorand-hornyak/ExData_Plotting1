## Read all the data from txt file
    d <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## Create a subset for relevant rows of the data set
    dp <- d[(d$Date=="1/2/2007" | d$Date=="2/2/2007" ), ]

## Set System local settings to English, because of the days name should be in English instead of any local language
    Sys.setlocale("LC_TIME", "English")

## Convert first column to Date and second column to Datetime class
    dp$Date <- as.Date(dp$Date , "%d/%m/%Y")
    dp$Time <- paste(dp$Date, dp$Time, sep=" ")
    dp$Time <- strptime(dp$Time, "%Y-%m-%d %H:%M:%S")

## Generating plot to monitor device
    plot(dp$Time, dp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(dp$Time, dp$Sub_metering_2, col="red")
    lines(dp$Time, dp$Sub_metering_3, col="blue")

## Add legend to the plot
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
    
## Create png file by copying plot from monitor to file device
    dev.copy(png, file="plot3.png", height=480, width=480)
    dev.off()