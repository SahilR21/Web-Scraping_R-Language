#Project 3 - Web Scraping - Scraping the tables - other method
#List of apple cultivars

#Library
library(dplyr)
library(rvest)

#link of website
wiki_link = "https://en.wikipedia.org/wiki/List_of_apple_cultivars"
#Reading the page
wiki_page = read_html(wiki_link)

#getting the apple table
#give all table
#apple_table = wiki_page %>% html_nodes("table") 
#apple_table

#to get the specific table that we are targetting
apple_table = wiki_page %>% html_nodes("table") %>% . [2] %>%
  html_table() %>% .[[1]]
apple_table

#save the file
write.csv(apple_table,"List of Apple Cultivars.csv")

















