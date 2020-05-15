library(jsonlite)
library(rvest)
library(rcurl)


html_file <- read_html("messages.html")
xml <- read_xml("messages.html")

test <- jsonlite::toJSON(html_file, force = TRUE)

post_time <- vector()
post_author <- vector()
post_message <- vector()
forward_time <- vector()
forward_author <- vector()
step_1_forward_time_author <- list()
forward_message <- vector()

for (i in 1:length(message_id)) {
  
  
  
  step_1_poster <- html_file %>%
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]")) %>%
    html_nodes("div.from_name") %>% 
    html_text() %>%
    trimws()
  
   
  step_1_time <- html_file %>%
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]")) %>%
    html_nodes("div.pull_right") %>% 
    html_attr("title")
  
  step_1_message <- html_file %>%
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]/div[2]/div[4]")) %>%
    html_text() %>%
    trimws()
  
  
  step_1_forward_time_author <- 
    html_file %>%
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]/div[2]/div[4]/div[1]")) %>%
    html_text() %>%
    trimws() %>%
    str_split("  ")
  
  
  step_1_forward_message <- 
    html_file %>%
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]/div[2]/div[4]/div[3]")) %>%
    html_text() %>%
    trimws()
  
  message(is_empty(step_1_forward_time_author))
  message(step_1_forward_time_author)
  
  if(is_empty(step_1_message)){
    post_message[i] <- NA
  } else {
    post_message[i] <- step_1_message
  }
  
  if(is_empty(step_1_forward_message)){
    post_message[i] <- post_message[i]
  } else {
    post_message[i] <- NA
  }

  
  
  if(is_empty(step_1_forward_message)){
    forward_message[i] <- NA
  } else {
    forward_message[i] <- step_1_forward_message
  }
  
  
  
  if(is_empty(step_1_forward_time_author)){
    forward_time[i] <- NA
    forward_author[i] <- NA
  } else {
    forward_time[i] <- step_1_forward_time_author[[1]][2]
    forward_author[i] <- step_1_forward_time_author[[1]][1]
   
  }
  
  message(step_1_time)
  
  if(length(step_1_time) > 0){
    post_time[i] <- step_1_time
  } else {
    post_time[i] <- NA
  }
  
  
  
  if(length(step_1_poster) > 0){
    post_author[i] <- step_1_poster
  } else {
    post_author[i] <- NA
  }
  
  
  
  message(i)}

//*[@id="message22"]/div[2]/div[4]










test <- test %>% trimws() %>%
  str_split("  ")

test <- html_file %>%
  html_nodes(xpath = paste0("//*[@id=", '"',message_id[9],'"' ,"]/div[2]/div[4]")) %>%
  html_text() %>%
  trimws()




//*[@id="message8"]/div[2]/div[4]/div[1]

tible_test <- tibble::tibble(message_id = message_id,post_author = post_author, post_time = post_time, post_message = post_message, forward_author = forward_author, forward_time = forward_time, forward_message = forward_message)

test134 <- html_file %>%
  html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]")) %>%
  html_nodes("div.from_name") %>% 
  html_text()




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
