oneMean <- function(file,polluttant){
  data = read.csv(file)
  col <- data[,polluttant]
  col <- col[!is.na(col)] 
  return (col)
}

pollutantmean <- function(directory, pollutant, id) {
  # calculates the mean of a pollutant (sulfate or nitrate) 
  # across a specified list of monitors.
  somme = c()
  
  for (num in id){
    
    if (num < 10){
      filepath = paste(directory,"00", num, ".csv", sep = "") 
    }
    else if (num >= 10 && num < 100){
      filepath = paste(directory,"0", num, ".csv", sep = "")
    }
    else{
      filepath = paste(directory, num, ".csv", sep = "")
    }
    somme <- c(somme,oneMean(filepath, pollutant))
  }
  
  return (mean(somme))
}


