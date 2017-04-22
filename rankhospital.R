rankhospital <- function(state, outcome, num = "best") {
  df_outcome <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  p_outcomes <- c("heart attack","heart failure","pneumonia")
  
  if(state %in% df_outcome[,7] == FALSE) {
    stop("invalid state")}
  else if(outcome %in% p_outcomes == FALSE) {
    stop(print("invalid outcome"))
  }
  col_num <- if(outcome == "heart attack"){11}
  else if(outcome == "heart failure"){17}
  else{23}
  df_outcome[, col_num] <- suppressWarnings(as.numeric(df_outcome[, col_num]))
  state_rank <- subset(df_outcome, State == state)
  df_outcome1 <- state_rank[order(state_rank[,col_num],state_rank[,2]),]
  df_outcome2 <- df_outcome1[!is.na(df_outcome1[,col_num]),]
  r_num <- if(num == "best"){1}
  else if(num == "worst"){nrow(df_outcome2)} 
  else if(num > max(df_outcome2[,col_num], na.rm = TRUE)) {stop(print(NA))}
  else{num}
  
  return(df_outcome2[r_num,2])
}
  