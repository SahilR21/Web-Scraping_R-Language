#Project 3 - Web Scraping - Scraping the tables
#Lirary
library(dplyr)
library(rvest)

#Link of page
col_link = "https://www.patriotsoftware.com/blog/accounting/average-cost-living-by-state/"
#Reading html code from the link
col_page = read_html(col_link)
#Taking the table
# get this table name from the inspect of tabel as it help to get all table infomration
col_table = col_page %>% html_nodes("figure.wp-block-table") %>% 
  html_table() %>% .[[1]]

#save the csv
write.csv(col_table,"Average Cost of Living.csv")








