#====================================================================================================
# 작성일자 : 2021.03.11
# 작성목적 : Hands-On Programing with R 2장 관련 소스 
#====================================================================================================

die <- c(1, 2, 3, 4, 5, 6)
die

is.vector(die) #TRUE

five <- 5
is.vector(five) #TRUE


length(die)  #6
length(five) #1


typeof(die)  # "double"

int <- c(-1L, 2L, 4L)
int
typeof(int) #"integer"


text <-c("hello", "world")
text
typeof(text) #"character"


3 > 4 #FALSE
logic <-c(TRUE, FALSE, TRUE)
typeof(logic)  #"logical"

hand <- c("ace", "king", "queen", "jack", "ten")
typeof(hand)



attributes(die) #NULL <- atomic vector 이므로 

names(die) #NULL

names(die) <- c("one", "two", "three", "four", "five", "siz")
attributes(die)
die

names(die) <- NULL


dim(die) <- c(2, 3)
die
dim(die) <- c(3, 2)
die

dim(die) <- NULL
die


# matrix는 2차원 배열, array는 다차원 배열 
m <- matrix(die, nrow = 3)
m

ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar


hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")

matrix(hand1, nrow = 5)
matrix(hand1, ncol = 5)
dim(hand1) <- c(5,2)
hand1


hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack", "spades", "ten", "spades")
matrix(hand2, nrow = 2, byrow = TRUE)
matrix(hand2, ncol = 2, byrow = TRUE)





