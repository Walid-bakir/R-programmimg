corr <- function(directory, threshold = 0){
  
  #Write a function that takes a directory of data files and a threshold for 
  #complete cases and calculates the correlation between sulfate and nitrate 
  #for monitor locations where the number of completely observed cases 
  #(on all variables) is greater than the threshold. 
  #The function should return a vector of correlations for the monitors that 
  #meet the threshold requirement. If no monitors meet the threshold requirement, 
  #then the function should return a numeric vector of length 0.
  
  setwd("C:/Users/Walid/Desktop/R-programmimg/Air-Pollution/")
  
  correlation = c()
  
  complete = complete("specdata/")
  
  condition = complete['nobs'] > threshold
  complete_ids = complete['id'][condition]
  
  for (num in complete_ids){
    
    
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
    data = na.omit(data)
    correlation = c(correlation, cor(data[,2], data[,3]))
    
    
  }
  
  return (correlation)
  
  
}