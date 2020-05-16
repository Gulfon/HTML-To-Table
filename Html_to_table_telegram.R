library(jsonlite)
library(rvest)
library(rcurl)



for (n in 1:1) {
html_file <- read_html(paste0("[Group1]messages",n,".html"))






post_time <- vector()
post_author <- vector()
post_message <- vector()
forward_time <- vector()
forward_author <- vector()
step_1_forward_time_author <- list()
forward_message <- vector()
message_id <- html_file %>% 
  html_nodes("div.message") %>% 
  html_attr("id")




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
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]/div[2]/div[contains(@class, 'text')]")) %>%
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
    html_nodes(xpath = paste0("//*[@id=", '"',message_id[i],'"' ,"]/div[2]/div[4]/div[contains(@class, 'text')]")) %>%
    html_text() %>%
    trimws()
  
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

nam <- paste0("group_1_",n)
assign(nam, tibble::tibble(message_id = message_id,post_author = post_author, post_time = post_time, post_message = post_message, forward_author = forward_author, forward_time = forward_time, forward_message = forward_message))

}


join_test <- group_1_1 %>% full_join(group_2_1) %>%
  full_join(group_2_2) %>%
  full_join(group_2_3) %>%
  full_join(group_2_4) %>%
  full_join(group_2_5) %>%
  full_join(group_2_6) %>%
  full_join(group_2_7) %>%
  full_join(group_2_8) %>%
  full_join(group_2_9) %>%
  full_join(group_2_10) %>%
  full_join(group_2_11) %>%
  full_join(group_2_12) %>%
  full_join(group_2_13) %>%
  full_join(group_2_14) %>%
  full_join(group_3_1) %>%
  full_join(group_3_2) %>%
  filter(!is.na(post_author))


qplot(join_test$post_author)


join_final <- join_test[,-1] %>%
  mutate(post_time = dmy_hms(post_time), forward_time = dmy_hms(forward_time))

library(ggplot2)
library(lubridate)

write_csv(join_final, "telegram_groups_no_photo_links.csv")

html_file <- read_html(paste0("[Group1]messages1.html"))

message_id <- html_file %>% 
  html_nodes("div.message") %>% 
  html_attr("id")

message_id <- html_file %>% 
  html_nodes(xpath = '//*[@id="message56"]/div[2]/div[3]/a') %>%
  html_attr('href')


