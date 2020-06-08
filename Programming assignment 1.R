# PART 1 
# Calculate the mean of a pollutant across a specified list of monitors
pollutantmean <- function(directory, pollutant, id = 1:332){
  # create a list of file names with data
  fileNames <- list.files(path = "~/Documents/LearningR/DataScienceCoursera/specdata/" , full.names = TRUE)[id]
  # initialize dataRaw data frame to store all data in the range
  dataRaw <- data.frame() 
  for(i in seq(along.with = id)){
    dataRaw <- rbind.data.frame(dataRaw, read.csv(fileNames[i]))}
  mean(dataRaw[[pollutant]], na.rm = TRUE )}

#Part 2
# reads all the files and reports the number of completely observed cases in each data file
complete <- function(directory, id =  1:332){
  # initialize nobs data frame of 2 cols of id number and complete count
  nob <- data.frame(id = id, nobs = vector("numeric", length = length(id)))
  # create a list of target id files
  fileNames <- list.files(directory, full.names = TRUE)[id]
  # read each file put number of complete cases in nobs col
  for(i in seq(along.with = id)){
    dataRaw <- read.csv(fileNames[i])
    nob$nobs[i] <- sum(complete.cases(dataRaw$sulfate,dataRaw$nitrate))
  }
  nob}

# PART 3
#calculate correlation between sulfate and nitrate for locations with complete cases greater than threshold

# This following process is not good, read file twice
corr <- function(directory, threshold = 0){
  # if no one above threshold, return--
  corr <- vector("numeric", length = 0)
  # data frame data with only ids above threshold
  comp <- complete(directory, 1:332)
  data <- comp[comp$nobs>threshold,]
  # generate filenames for only these data
  fileNames <- list.files(directory, full.names = TRUE)[data$id]
  # if no id over threshold, return initial corr
  if(nrow(data) == 0){
    corr
  }
  # else read data for each id to generate corr vector
  else{
    for(i in 1:nrow(data)){
      dataRaw <- read.csv(fileNames[i])
      sul <- dataRaw$sulfate
      nit <- dataRaw$nitrate
      corr[i] <- cor(sul[complete.cases(dataRaw)], nit[complete.cases(dataRaw)])
    }
    corr
  }
}

# should be initial a corr - read file - check complete.cases sum - if greater calcualte cor and add to a vector 
# - else next id




