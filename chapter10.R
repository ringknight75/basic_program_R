#====================================================================================================
# 작성일자 : 2021.03.29
# 작성목적 : Hands-On Programing with R 10장 관련 소스 
#====================================================================================================



# 1. 순수 for문을 이용한 함수 
abs_loop <- function(vec){
  for(i in 1:length(vec)){
    if(vec[i] <0 ){
      vec[i] <- -vec[i]
    }
  }
}

# 2. Vectorized function 함수 
abs_set <- function(vec){
  negs <- vec < 0
  vec[negs] <- vec[negs] * -1
  vec
}


long <- rep(c(-1, 1), 50000000)

# 1. 순수 for문을 이용한 함수 
system.time(abs_loop(long))
#  user  system elapsed 
# 5.925   0.150   6.078

# 2. Vectorized function 함수 
system.time(abs_set(long))
#  user  system elapsed 
# 1.487   0.573   2.065 

# 3. 내장 함수 
system.time(abs(long))
#  user  system elapsed 
# 0.185   0.139   0.323




change_symbols <- function(vec){
  for(i in 1:length(vec)){
    if(vec[i] == "DD"){
      vec[i] <- "joker"
    } else if (vec[i] == "C") {
      vec[i] <- "ace"
    } else if (vec[i] == "7") {
      vec[i] <- "king"
    } else if (vec[i] == "B") {
      vec[i] <- "queen"
    } else if (vec[i] == "BB") {
      vec[i] <- "jack"
    } else if (vec[i] == "BBB") {
      vec[i] <- "ten"
    } else  {
      vec[i] <- "nine"
    }
  }
}


vec <- c("D", "C", "7", "B", "BB", "BBB", "0")

change_symbols(vec)

