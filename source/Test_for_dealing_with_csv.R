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
  text_date <- as.character(date)
  resultant <- append(c(text_date), total)
  temp_row <- as.data.frame(t(resultant))
  colnames(temp_row) <- append(to_add, data$STATE)
  result <- rbind(result, temp_row)
}
View(result)
result <- result[-c(1),]
write.csv(result, "../data/Trans-Care-by-state-aggragate.csv", row.names = FALSE)
