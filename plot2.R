## plot2.R
## Reading the household power consumption file to R

## the date column is reformatted as recommended in the assignment instructions
## subset the data for the 2 days needed from x and assigned to new data frame named "powerdf"
## the Global_active_power column is reformatted as a numeric vector
## a new column titled "timestamp" is added to df. 
## This column consists of the date and time pasted together and reformatted
## file is saved as "plot2.png"
## device is closed
## statement is printed to let you know where the file has been successfully saved

plot2 <- function(file){
        
        x <- read.table(file, header=T, sep=";")
        x$Date <- as.Date(x$Date, format="%d/%m/%Y")       
        df <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]        
        df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
        
        df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
        plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
        cat("plot2.png has been saved in", getwd())
}