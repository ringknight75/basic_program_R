#====================================================================================================
# 작성일자 : 2021.03.22
# 작성목적 : Hands-On Programing with R 7 ~ 8장 관련 소스 
#====================================================================================================



get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size= 3, replace = TRUE, prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52 ))
}

get_symbols()

payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
payouts

class(payouts)
str(payouts)

payouts["DD"]
unname(payouts["DD"]) # 값만 표시됨 




symbols <- c("7","7","7")
symbols <- c("B","BB","BBB")
symbols <- c("C","DD","0")

# identify case
same <- symbols[1] == symbols[2] &&  symbols[2] == symbols[3]
bars <- symbols %in% c("B", "BB", "BBB")

# get prize
if(same){
  print("look up the prize")  
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]])
} else if (all(bars)) {
  print("assign $5")  
  prize <- 5
} else {
  # count cherries
  print("count cherries")  
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1] #체리 2개일 경우 5점, 1개일 경우 2점, 없는 경우 0점 
  prize
}

#adjust for diamonds
diamonds <- sum(symbols == 'DD')
prize * 2 ^ diamonds




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

play <- function(){
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}

play()

one_play <- play()
one_play

attributes(DECK)

row.names(DECK)

row.names(DECK) <- 101:152

levels(DECK) <- c("level1", "level2", "level3")

attributes(DECK)


attributes(one_play)

attr(one_play, "symbols") <- c("B", "0", "B")
attributes(one_play)
attr(one_play, "symbols")

one_play

one_play + 1


play <- function(){
  symbols <- get_symbols()
  score(symbols)
  attr(prize, "symbols") <- symbols
  prize
}

play()


play <- function(){
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols)
}

play()



slot_display <- function(prize){
  symbols <- attr(prize, "symbols")
  symbols <- paste(symbols, collapse = " ")
  string <- paste(symbols, prize, sep = "\n$")
  cat(string)
  
}

slot_display(one_play)

print

methods(print)

class(one_play) <- "slots"
attributes(one_play)

args(print)

print.slots <- function(x, ...){
  cat("I'm using the print.slots method")
}

print(one_play)

one_play


rm(print.slots)

now <- Sys.time()
attributes(now)


print.slots <- function(x, ...){
  slot_display(x)
}


print(one_play)
one_play



play <- function(){
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols, class = "slots")
}

play()

methods(class = "factor")

play1 <- play()
play2 <- play()

c(play1, play2)

