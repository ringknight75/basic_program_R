#====================================================================================================
# 작성일자 : 2021.03.18
# 작성목적 : Hands-On Programing with R 6장 관련 소스 
#====================================================================================================


library(pryr)
library(dplyr)
# install.packages("pryr")

parenvs(all = TRUE)


as.environment("package:stats")
as.environment("package:dplyr")

globalenv()

parent.env(globalenv())

ls(globalenv())

head(globalenv()$deck, 3)

assign("new", "Hello Global", envir = globalenv())
new


show_env <- function() {
  list(ran.in = environment(), 
       parent = parent.env(environment()),
       objects = ls.str(environment()))
}

show_env()


setup <- function(deck){
  
  DECK <- deck
  
  DEAL <- function(){
    card <- deck[1,]
#    assign("deck", deck[-1,], envir = parent.env(environment()))
    assign("deck", deck[-1,], envir = globalenv())
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
#    assign("deck", DECK[random,], envir = parent.env(environment()))
    assign("deck", DECK[random,], envir = globalenv())
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
  
}
head(deck)
cards <- setup(deck)
deal <- card$deal
shuffle <- card$shuffle





