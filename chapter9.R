#====================================================================================================
# 작성일자 : 2021.03.24
# 작성목적 : Hands-On Programing with R 9장 관련 소스 
#====================================================================================================

# 7장 함수 
# menu > Code > Extract  Function 사용 
score <- function(symbols) {
  # identify case
  same <- symbols[1] == symbols[2] &&  symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if(same){
    # print("look up the prize")  
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    print("assign $5")  
    prize <- 5
  } else {
    # count cherries
    # print("count cherries")  
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1] #체리 2개일 경우 5점, 1개일 경우 2점, 없는 경우 0점 
    prize
  }
  
  #adjust for diamonds
  diamonds <- sum(symbols == 'DD')
  prize * 2 ^ diamonds
}

#====================================================================================================



die <- c(1, 2, 3, 4, 5, 6)

rolls <- expand.grid(die, die)
rolls


rolls$value <- rolls$Var1 + rolls$Var2
rolls


probs <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)
probs

rolls$Var1

probs[rolls$Var1]

rolls$prob1 <- probs[rolls$Var1]
head(rolls, 3)


rolls$prob2 <- probs[rolls$Var2]
head(rolls, 3)

rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls, 3)



wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)
combos

get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}
get_symbols()

prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]
head(combos, 3)

combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
head(combos, 3)
sum(combos$prob)




symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
symbols
score(symbols)


chars <- vector(length = 4)
words <- c("my", "fourth", "for", "loop")
for(i in 1:4){
  chars[i] <- words[i]
}
chars


combos$prize <- NA
head(combos, 3)

library(tidyverse)
combos %>% mutate(prize = score(c(Var1, Var2, Var3)))  # 비정상적으로 수행됨 
combos$prize <- NULL

for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
head(combos)

sum(combos$prize * combos$prob) #0.538014 


score <- function(symbols) {
  
  diamonds <- sum(symbols == "DD")
  cherries <- sum(symbols == "C")
  
  slots <- symbols[symbols != "DD"]
  same  <- length(unique(slots))  ==  1
  # identify case
  # same <- symbols[1] == symbols[2] &&  symbols[2] == symbols[3]
  bars <- slots %in% c("B", "BB", "BBB")
  
  # get prize
  if (diamonds == 3) {
    prize <- 100
  } else if(same){
    # print("look up the prize")  
    payouts <- c("7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    # print("assign $5")  
    prize <- 5
  } else if (cherries > 0) {
    # count cherries
    # print("count cherries")  
    # cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + diamonds + 1] #체리 2개일 경우 5점, 1개일 경우 2점, 없는 경우 0점 
  } else {
    prize <- 0
  }
  
  #adjust for diamonds
  # diamonds <- sum(symbols == 'DD')
  prize * 2 ^ diamonds
}

combos$prize <- NULL
for (i in 1:nrow(combos)) {
  symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
  combos$prize[i] <- score(symbols)
}
head(combos)
combos[is.na(combos$prize),]

sum(combos$prize * combos$prob) #0.538014 

