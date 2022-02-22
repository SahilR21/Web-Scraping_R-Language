#project 2 - Web Scrapping
#Screpping the film informatioon of top 25,000 adventure movie

#Downalod - Selector Gadget in your chrome as it help to get the CSS tag for diffente element on web pages

#use the library
library(rvest)
library(dplyr)

#link of website
link = "https://www.imdb.com/search/title/?genres=adventure&sort=user_rating,desc&title_type=feature&num_votes=25000,"
#Getting html code from the webstie
page = read_html(link)

#%>% pipe meaning
#a %>% mean()
#mean(a)
# this both are equivalent

#screep: name, year, reading and synopsis
#inside html_nodes used the selector gadget tool
name = page %>% html_nodes(".lister-item-header a") %>% html_text() 
year  = page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()

#creating dataframe of all information
movies = data.frame(name,year,rating,synopsis,stringsAsFactors = FALSE)
print(movies)

#save the file as a movies.csv
write.csv(movies,"Adventure_movie.csv")





