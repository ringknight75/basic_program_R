#====================================================================================================
# 작성일자 : 2021.03.17
# 작성목적 : Hands-On Programing with R 4~5장 관련 소스 
#====================================================================================================

getwd()

deck <- read.csv("card.csv")

nrow(deck) #52, 총 카드는 52장으로 구성되어짐 
head(deck)

deck[1, c(2, 3)]
deck[1, 2:3]

deck[c(1, 2), 1]  #(주의) return vector 

deck[1, ]

deck[1, c(TRUE, TRUE, FALSE)]

deck[1, c("face", "suit", "value")]

deck$value        #(주의) return vector 


mean(deck$value)  # 평균 7 출력 
mean(deck[,3])


lst <- list(number = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst

lst[1]
lst[[1]]

lst["number"]   # 리스트 리턴 
lst[["number"]] # 벡터 리턴 

sum(lst[[1]])   #3
sum(lst$number) #3





# 1) 제일 위의 카드를 뽑는 것 
deal <- function(cards){
  cards[1, ]
}


# 2) 카드를 다시 썩는 행위 
shuffle <- function(cards) {
  random <- sample(1:52, size = 52)
  cards[random, ]
}


deal(deck)
deck2 <- shuffle(deck)
deal(deck2)


#====================================================================================================
#   5장 
#====================================================================================================
deck2 <- deck


deck2$new <- 1:52
head(deck2)

deck2$new <- NULL
head(deck2)



deck2[c(13, 26, 39, 52), ]
deck2$value[c(13, 26, 39, 52)]  <- 14
head(deck2, 13)


deck3 <- shuffle(deck)
head(deck3, 20)

deck3$value[deck3$face == "ace"] <- 14



