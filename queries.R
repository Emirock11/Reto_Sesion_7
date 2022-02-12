install.packages("gitcreds")
library(gitcreds)
gitcreds_set()
gitcreds_get()

# git config --global user.name "Emirock11"
# git config --global user.email "emi.rock11@hotmail.com"

# install.packages("DBI")
# install.packages("RMySQL")
# install.packages("dplyr")

library(DBI)
library(RMySQL)
library(dplyr)


MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

popEsp <-  DataDB %>% filter(Language == "Spanish")

install.packages("ggplot2")
library(ggplot2)

ggplot(popEsp, aes(x = Percentage, y = CountryCode, col = IsOfficial)) + geom_point() 




  