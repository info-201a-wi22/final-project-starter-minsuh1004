#This file is meant as a ground to test various ways of interpreting the 
#Trans-care-by-State csv
library('tidyverse')
data <- read.csv('../data/Trans-Care-by-state.csv')
View(data)
#for every date between may 7th 2015 to jan 1st 2021, make an entry in a new csv
#for each state with a score
dates <- seq(as.Date("2015-05-07"), as.Date("2021-01-01"), by="days")

to_add <- c("Date")
result <- data.frame(t(append(to_add, data$STATE)))
colnames(result) <- append(to_add, data$STATE)
count <- 1
for(date in dates){
  score1 <- c()
  for(value in data$Date.of.Antidiscrimition.bill.for.trans.people.in.private.healthcare){
    start <- str_split_fixed(value, " until ", 2)[1]
    end <- str_split_fixed(str_split_fixed(value, " until ", 2)[2], " then reinstated ", 2)[1]
    reinstate <- str_split_fixed(value, " then reinstated ", 2)[2]
    startd <- as.Date(start, "%b %d %Y")
    endd <- as.Date(end, "%b %d %Y")
    reinstated <- as.Date(reinstate, "%b %d %Y")
    if(start == ""){
      startd = as.Date("0000-01-01")
    }
    if(end == ""){
      endd = as.Date("0000-01-01")
    }
    if(reinstate == ""){
      reinstated <- as.Date("0000-01-01")
    }
    if(((start == "" || date > startd)) && (end == "" || date < endd || (reinstate == "" || date > reinstated))){
      score1 <-append(score1, c(1))
    }
    else{
      score1 <- append(score1, c(0))
    }
  }
  score2 <- c()
  for(value in data$Date.of.Ban.for.transgender.care.exclusions.for.private.insurance){
    start <- str_split_fixed(value, " until ", 2)[1]
    end <- str_split_fixed(str_split_fixed(value, " until ", 2)[2], " then reinstated ", 2)[1]
    reinstate <- str_split_fixed(value, " then reinstated ", 2)[2]
    startd <- as.Date(start, "%b %d %Y")
    endd <- as.Date(end, "%b %d %Y")
    reinstated <- as.Date(reinstate, "%b %d %Y")
    if(((start == "" || date > startd)) && (end == "" || date < endd || (reinstate == "" || date > reinstated))){
      score2 <- append(score2, c(1))
    }
    else{
      score2 <- append(score2, c(0))
    }
  }
  score3 <- c()
  for(value in data$Date.of.Medicad.including.trans.care){
    start <- str_split_fixed(value, " until ", 2)[1]
    end <- str_split_fixed(str_split_fixed(value, " until ", 2)[2], " then reinstated ", 2)[1]
    reinstate <- str_split_fixed(value, " then reinstated ", 2)[2]
    startd <- as.Date(start, "%b %d %Y")
    endd <- as.Date(end, "%b %d %Y")
    reinstated <- as.Date(reinstate, "%b %d %Y")
    if(((start == "" || date > startd)) && (end == "" || date < endd || (reinstate == "" || date > reinstated))){
       score3 <- append(score3, c(1))
    }
    else{
      score3 <- append(score3, c(0))
    }
  }
  score4 <- c()
  for(value in data$Date.of.Medicaid.exluding.trans.care){
    start <- str_split_fixed(value, " until ", 2)[1]
    end <- str_split_fixed(str_split_fixed(value, " until ", 2)[2], " then reinstated ", 2)[1]
    reinstate <- str_split_fixed(value, " then reinstated ", 2)[2]
    startd <- as.Date(start, "%b %d %Y")
    endd <- as.Date(end, "%b %d %Y")
    reinstated <- as.Date(reinstate, "%b %d %Y")
    if(((start == "" || date > startd)) && (end == "" || date < endd || (reinstate == "" || date > reinstated))){
      score4 <- append(score4, -1)
    }
    else{
      score4 <- append(score4, c(0))
    }
  }
  total <- score1 + score2 + score3 + score4
  print(count)
  temp <- as.character(dates[count])
  print(temp)
  count <- count + 1
  resultant <- append(c(temp), total)
  temp_row <- as.data.frame(t(resultant))
  colnames(temp_row) <- append(to_add, data$STATE)
  result <- rbind(result, temp_row)
}
View(result)
result <- result[-c(1),]
write.csv(result, "../data/Trans-Care-by-state-aggragate.csv", row.names = FALSE)
#The following is meant to test ideas for a widgit demonstating the reporting problem

crime <- read.csv("../data/hate_crime.csv")
filtered <- select(crime, c("DATA_YEAR", "STATE_NAME", "BIAS_DESC"))
anaylsis_1 <- group_by(filtered, BIAS_DESC, STATE_NAME) %>%
  summarize(NUM_REPORT = n())
temp <- str_split(anaylsis_1$BIAS_DESC, ";")
unique_bias <- c("State")
for (to_check in temp) {
  for (word in to_check){
    #print(!(word %in% unique_bias))
    if(!(word %in% unique_bias)){
      #print(word)
      unique_bias <- append(unique_bias, word)
    }
  }
}
states <- c("")
for (to_check in anaylsis_1$STATE_NAME) {
    if(!(to_check %in% states)){
      #print(word)
      states <- append(states, to_check)
    }
}
biases <- unique_bias
new_df <- data.frame(matrix(ncol = length(biases) - 1), nrow = 0)
colnames(new_df) <- make.names(biases)
for(state in states){
  to_work_with <- filter(anaylsis_1, STATE_NAME == state)
  row_add <- c(state)
  for(varr in biases){
    if(varr != "State"){
      varr <- str_split_fixed(varr, "\\(",2)[1]
      to_add <- filter(to_work_with, str_detect(BIAS_DESC, varr))
      to_add <- sum(to_add$NUM_REPORT)
      row_add <- append(row_add, to_add)
    }
  }
  new_df[nrow(new_df) + 1,] <- row_add
}
new_df2 <- new_df[-c(1,2), ]
write.csv(new_df2,"../data/Attempt_to_Quantify_reporting.csv", row.names = FALSE)

#Plan for widget: take columns with a higher chance of having a less severe reporting
#problem and use them to create a baseline for each state and see if the anti-transgender
#reports are below this baseline expectatoin
census <- read.csv("../data/Census_data.csv")
q <- read.csv("../data/Queer-pop-by-percent.csv")

