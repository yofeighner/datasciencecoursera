corr <- function(directory, threshold = 0) {
         
        list_files <- list.files(directory, full.names = TRUE)
         
        dat1 <- numeric()
         
        for (i in 1:length(list_files)) {
            dat2 <- read.csv(list_files[i], header=TRUE)
            dat2 <- dat2[complete.cases(dat2),]
        if(nrow(dat2) > threshold) {
                     dat1 <- c(dat1, cor(dat2$sulfate, dat2$nitrate))
                 }  
           }
         return(dat1)}