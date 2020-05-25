x <- c(1, 3,5 ); y <- c(3, 2,10)
rbind(x,y)
x <- 1:4 ; y<- 2:3
x+y
class(x+y)
read.csv(hw1_data.csv)
read.csv(file=hw1_data.csv, header = TRUE)
ozone
temp[temp$Month==6, ]
mt <- temp[temp$Month==6, ]["Temp"]
num <- mt["Temp"]
mean(num[ ,1])
oz <- hw1_data[ , c("Ozone", "Month")]
mo <- oz[oz$Month==5, ]["Ozone"]
si <- oz["Ozone"]
nana <- si[!is.na(si)]
mean(nana)