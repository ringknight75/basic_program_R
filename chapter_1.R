#====================================================================================================
# 작성일자 : 2021.03.10
# 작성목적 : Hands-On Programing with R 1장 관련 소스 
#====================================================================================================

die <- 1:6

?sample


sample(die, size = 2)  # without replacement 
  
sample(die, size = 2, replace = TRUE)  # replacement 


dice <- sample(die, size = 2, replace = TRUE) 
dice

sum(dice)


roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE) 
  sum(dice)
}

roll()


roll2 <- function(bones){
  dice <- sample(bones, size = 2, replace = TRUE) 
  sum(dice)
}

roll2 <- function(bones = 1:6){
  dice <- sample(bones, size = 2, replace = TRUE) 
  sum(dice)
}

roll2(bones = 1:4)
roll2(1:6)
roll2()


#====================================================================================================

library(ggplot2)

qplot

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
y <- x^3

qplot(x, y)

x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x2 <-c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)

x3 <-c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)


?replicate
??replicate
replicate(10, roll())  # R Command many times 

rolls <- replicate(10000, roll()) 
qplot(rolls, binwidth = 1)


# 6를 더 나오게 확률을 올린다. 
roll3 <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE, prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8)) 
  sum(dice)
}
rolls <- replicate(10000, roll3()) 
qplot(rolls, binwidth = 1)

