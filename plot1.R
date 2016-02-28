#Get the whole dataset
data_all <- "./household_power_consumption.txt"
data <- read.table(data_all, header=T, sep=";", stringsAsFactors=F, dec=".")
#Get the subset we need to use of the dataset
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
#change data type of dates
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#find the useful data
global_active_power <- as.numeric(data_subset$Global_active_power)
#plot the figure 1
png("plot1.png", width=480, height=480)
hist(global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

