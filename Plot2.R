#Read the full dataset
household_power_consumption <- read.csv("~/R Workspace/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",as.is=TRUE )

#View the structure of the dataset
#str(household_power_consumption)

#reformat the date in date format
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

#Subset the data from  2007-02-01 and 2007-02-02

hpc_data <- subset(household_power_consumption,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Remove the full dataset to free the memory
rm(household_power_consumption)

#Combine the date & time and format it to datetime 
DateTime <- paste(as.Date(hpc_data$Date), hpc_data$Time)
hpc_data$Datetime <- as.POSIXct(DateTime)

#Define the plot in PNG
png("plot2.png", width=480, height=480)

#create plot 2
plot(as.numeric(hpc_data$Global_active_power)~hpc_data$Datetime, main="Global Active Power",xlab="",type="l", ylab="Global Active Power (kilowatts)")

dev.off()