rankall <- function(outcome, num = "best"){
  df_outcome <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character") ## read data
  p_outcomes <- c("heart attack","heart failure","pneumonia") ## list possible outcomes to test validity
  
 if(outcome %in% p_outcomes == FALSE) { ## if given outcome is not in possible outcomes, stop and print invalid outcome
    stop(print("invalid outcome"))
  }
  col_num <- if(outcome == "heart attack"){11} ## determine column number based on given outcome
  else if(outcome == "heart failure"){17}
  else{23}
  
  df_outcome[ ,col_num] <- suppressWarnings(as.numeric(df_outcome[ ,col_num]))
  
  s_states <- split(df_outcome, df_outcome$State) ## split by state
  hospital_names <- lapply(s_states, function(s_states) {
    h1 <- s_states[!is.na(s_states[col_num]),]
    h2 <- h1[order(h1[col_num],h1[2]),]
    r_num <- if(num == "best"){1} ## determine ranking number if given best, worst, or a number
    else if(num == "worst"){nrow(s_states)} 
    else{num}
    h2[r_num,2]})
  
data.frame(hospital=unlist(hospital_names), state=names(hospital_names))}