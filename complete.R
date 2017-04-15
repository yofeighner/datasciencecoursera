complete <- function(directory, id = 1:332) {

  list_files <- list.files(directory, full.names = TRUE)
  completes <- data.frame()
  nobs <- data.frame();
  for (i in id) { 
    nobs <- sum(complete.cases(read.csv(list_files[i], header = TRUE)))
    completes <- rbind(completes, data.frame(i,nobs))
  }
  completes
}