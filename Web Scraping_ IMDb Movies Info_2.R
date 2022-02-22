#project 2 - Web Scrapping - continue_02
#Scrapping the film information of top 25,000 adventure movie

#Download - Selector Gadget in your chrome as it help to get the CSS tag for diffente element on web pages

#use the library
library(rvest)
library(dplyr)

#link of website
link = "https://www.imdb.com/search/title/?genres=adventure&sort=user_rating,desc&title_type=feature&num_votes=25000,"
#Getting html code from the website
page = read_html(link)

#continue_02
# want to add stars of movies by adding one more column but want to add all stars which is inside the name link
#scrap cast from each of the link


#scrapping: name, year, reading and synopsis
#inside html_nodes used the selector gadget tool
name = page %>% html_nodes(".lister-item-header a") %>% html_text()
movie_links = page %>% html_node(".lister-item-header a") %>%
  html_attr("href") %>% paste("https://www.imdb.com",.,seb = "")

year  = page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()

#As we want to make one column about the cast members:
# creating object that take the movie_link and return cast
get_cast = function(movie_link){
  movie_page = read_html(movie_link)
  movie_cast = movie_page %>% html_nodes(".cast_list a") %>% html_text() %>%
    paste(collapse = ",")
  return(movie_cast)
}

#creating cast column
cast = supply(movie_links, FUN = get_cast)

#creating data frame of all information
movies = data.frame(name,year,rating,synopsis,cast,stringsAsFactors = FALSE)
print(movies)

#save the file as a movies.csv
write.csv(movies,"Adventure_movie.csv")