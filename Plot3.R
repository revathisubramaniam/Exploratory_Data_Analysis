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
png("plot3.png", width=480, height=480)

#create plot 3

  plot(hpc_data$Sub_metering_1~hpc_data$Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(hpc_data$Sub_metering_2~hpc_data$Datetime,col='Red')
  lines(hpc_data$Sub_metering_3~hpc_data$Datetime,col='Blue')
  
  # print the legend
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  


dev.off()