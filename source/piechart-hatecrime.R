hate_crimes <- read.csv("../data/hate_crime.csv")
library("dplyr")
library("stringr")
library("tidyr")
library("tidyverse")
library("ggplot2")

hate_crimes <- hate_crimes 
hate_crimes <- hate_crimes[-1,]
hate_crimes_trans <- hate_crimes  %>%
  filter(BIAS_DESC == "Anti-Gay (Male)")
table_by_state <- hate_crimes_trans %>%
  group_by(STATE_ABBR) %>%
  count()

print(pie_chart_hatecrimes <- 
        ggplot(table_by_state, aes( x = "" , y = n, fill = STATE_ABBR)) +
        geom_col(color = "white") +
        labs(
          subtitle = "Number Of Gay Hate Crimes By State",
          y = "Number of hate crimes",
          fill = "States Abbreviated"
        ) +
        coord_polar(theta = "y") 
)
