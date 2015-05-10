## plot3.R
## Reading the household power consumption file to R

## the date column is reformatted as recommended in the assignment instructions
## subset the data for the 2 days needed from x and assigned to new data frame named "powerdf"
## the Global_active_power column is reformatted as a numeric vector
## a new column titled "timestamp" is added to df. 
## This column consists of the date and time pasted together and reformatted
## the Sub_metering cols are reformatted as numeric vectors
## plot is generated with timestamp on x-axis and sub metering levels on y-axis. Default x-axis label is removed. Y-axis label is specified. Legend is added with to the top right with line colors 
## and variable names. 
## file is saved as "plot3.png"
## device is closed
## statement is printed to let you know where the file has been successfully saved

plot3 <- function(file){
        
        x <- read.table(file, header=T, sep=";")
        x$Date <- as.Date(x$Date, format="%d/%m/%Y")       
        df <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]           
        df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
       
        df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
        df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
        df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  
        plot(df$timestamp,df$Sub_metering_1, type="l", xlab="",
             ylab="Energy Sub metering", col="black")
        lines(df$timestamp,df$Sub_metering_2,col="red")
        lines(df$timestamp,df$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
                lty=c(1,1), lwd=c(1,1))
        
        dev.copy(png, file="plot3.png", width=480, height=480)
        dev.off()
        cat("plot3.png has been saved in", getwd())
}