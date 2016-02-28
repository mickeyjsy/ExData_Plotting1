#Get the whole dataset
data_all <- "./household_power_consumption.txt"
data <- read.table(data_all, header=T, sep=";", stringsAsFactors=F, dec=".")
#Get the subset we need to use of the dataset
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#change data type of dates
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#find the useful data
global_active_power <- as.numeric(data_subset$Global_active_power)
sub_metering1 <- as.numeric(data_subset$Sub_metering_1)
sub_metering2 <- as.numeric(data_subset$Sub_metering_2)
sub_metering3 <- as.numeric(data_subset$Sub_metering_3)
#plot the figure 3
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()