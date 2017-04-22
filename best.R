best <-function(state, outcome) {
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
        
        state_min <- subset(df_outcome, State == state)
        min_row <- suppressWarnings(which.min(state_min[,col_num]))
        result <- sort(state_min[min_row,2])
       return(result[1])}