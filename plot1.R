## plot1.R
## Reading the household power consumption file to R

## the date column is reformatted as recommended in the assignment instructions
## subset the data for the 2 days needed from x and assigned to new data frame named "powerdf"
## the Global_active_power column is reformatted as a numeric vector
## histogram is generated with the title "Global Active Power", red columns, and an x-axis label of "Global Active Power (kilowatts)"
## file is saved as "plot1.png"
## device is closed
## statement is printed to let you know where the file has been successfully saved

plot1 <- function(file){
      
        x <- read.table(file, header=T, sep=";")
        x$Date <- as.Date(x$Date, format="%d/%m/%Y")
        
        df <- x[(x$Date=="2007-02-01") | (x$Date=="2007-02-02"),]
        
        df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
        
        hist(df$Global_active_power, main = paste("Global Active Power"), 
             col="red", xlab="Global Active Power (kilowatts)")
        
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        cat("Plot1.png has been saved in", getwd())
         
}      
        
  