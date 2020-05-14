library(jsonlite)
library(rvest)
library(rcurl)


html_file <- read_html("messages.html")
xml <- read_xml("messages.html")

test <- jsonlite::toJSON(html_file, force = TRUE)


test


test <- html_file %>%
  html_nodes(xpath = paste0("//*[@id=", '"',message_id[13],'"' ,"]")) %>%
  html_nodes("div.pull_right") %>% 
  html_attr("title") 


html_file %>%
  html_nodes(xpath = '//*[@id="messag`e2"]') %>%
  html_nodes("div.pull_right") %>% 
  html_attr("title") 



sender <- html_file %>% 
  html_nodes("div.from_name") %>% 
  html_text()


test2 <- html_file %>% 
  html_nodes("div.text") %>% 
  html_text()

"//*[@id="message8"]"


paste0("'//*[@id=",message_id[9],"]'")






html_file %>%
  html_nodes(xpath = '//*[@id=“message9”]') %>%
  html_nodes("div.pull_right") %>% 
  html_attr("title") 



sender <- html_file %>% 
  html_nodes("div.from_name") %>% 
  html_text()

date <- html_file %>% 
  html_nodes("div.pull_right") %>% 
  html_attr("title") 


message_id <- html_file %>% 
  html_nodes("div.message") %>% 
  html_attr("id") 


test4 <- read_csv("telegram.csv", col_names = FALSE)


head(test2)
