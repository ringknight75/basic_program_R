#====================================================================================================
# 작성일자 : 2021.03.11
# 작성목적 : Hands-On Programing with R 2~3장 관련 소스 
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


die <- c(1, 2, 3, 4, 5, 6)
typeof(die)     #"double"
class(die)      #"numeric"
attributes(die) #NULL 


dim(die) <-c(2, 3)
typeof(die) #"double"
class(die)  #"matrix"
attributes(die) 
# $dim
# [1] 2 3



now <- Sys.time()
now
typeof(now) #"double"
class(now)  #"POSIXct" "POSIXt"
attributes(now) 
# $class
# [1] "POSIXct" "POSIXt"
unclass(now) # 1615511086, 1970-01-01이후 시간을 초 단위로 계산 


gender <- factor(c("male", "female", "female", "male"))
typeof(gender)     #"integer"
class(gender)      #"factor"
attributes(gender) 
# $levels
# [1] "female" "male"  
# $class
# [1] "factor"
unclass(gender)
# [1] 2 1 1 2
# attr(,"levels")
# [1] "female" "male"



list1 <- list(100:200, "R", list(TRUE, FALSE))
list1

card <- list("ace", "hearts", 1)
card



df <- data.frame(
  face = c("ace", "two", "six"),
  suit = c("clubs", "clubs", "clubs"),
  value = c(1, 2, 3)
)
df
typeof(df)     #"list"
class(df)      #"data.frame"
attributes(df) 
# $names
# [1] "face"  "suit"  "value"
# $class
# [1] "data.frame"
# $row.names
# [1] 1 2 3
str(df)
# 'data.frame':	3 obs. of  3 variables:
# $ face : Factor w/ 3 levels "ace","six","two": 1 3 2
# $ suit : Factor w/ 1 level "clubs": 1 1 1
# $ value: num  1 2 3


df <- data.frame(
  face = c("ace", "two", "six"),
  suit = c("clubs", "clubs", "clubs"),
  value = c(1, 2, 3),
  stringsAsFactors = FALSE
)
str(df)
# 'data.frame':	3 obs. of  3 variables:
# $ face : chr  "ace" "two" "six"
# $ suit : chr  "clubs" "clubs" "clubs"
# $ value: num  1 2 3


head(deck)
getwd()
write.csv(deck, file = "card.csv", row.names = FALSE)
