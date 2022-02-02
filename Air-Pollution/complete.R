complete <- function(directory, id = 1:332){
  
  #function that reads a directory full of files and reports the number of completely 
  #observed cases in each data file. The function should return a data frame where the 
  #first column is the name of the file and the second column is the number of complete cases. 
  #A prototype of this function follows
  
  ids <- c()
  missing <- c()
  
  
  for (num in id){
    
    if (num < 10){
      filepath = paste(directory,"/00", num, ".csv", sep = "") 
    }
    else if (num >= 10 && num < 100){
      filepath = paste(directory,"/0", num, ".csv", sep = "")
    }
    else{
      filepath = paste(directory,"/", num, ".csv", sep = "")
    }
    
    data <- read.csv(filepath)
    
    cc <- data[complete.cases(data),]
    
    ids <- c(ids, num)
    
    missing <- c(missing, nrow(cc))
    
  }
  
  return (data.frame(id = ids, nobs = missing))
}