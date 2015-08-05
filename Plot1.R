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

#Define the plot in PNG
png("plot1.png", width=480, height=480)

#create plot 1
hist(as.numeric(hpc_data$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()