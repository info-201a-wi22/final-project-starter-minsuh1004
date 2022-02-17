library("tidyverse")
source("../source/Summary.R")
table_1 <- in_summary[[1]]
table_2 <- in_summary[[2]]
table_3 <- in_summary[[3]]
table_4 <- in_summary[[4]]
table_5 <- in_summary[[5]]
table_6 <- in_summary[[6]]
tables <- list()
tables$by_year_table <- left_join(table_2, table_3, by = "Year") %>%
  left_join(table_4, by = "Year") %>%
  left_join(table_6, by = "Year")
colnames(tables$by_year_table) <- c("Year", "Deaths by Hate Crime", "Deaths by Suicide", "Hate Crimes", "Avg trans care score assinged per year")
colnames(table_5) <- c("State", "Hate Crimes")
colnames(table_1) <- c("State", "Average Score")
tables$by_state_table <- left_join(table_1, table_5, by = "State")

