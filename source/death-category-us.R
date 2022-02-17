library("ggplot2")
library("tidyr")
library("tidyverse")
library("plotly")

data_tdor <- read.csv("../data/TDoR-Data-All.csv")

death_category_us <- data_tdor %>%
  filter(Country == "USA") %>%
  mutate(Year = str_sub(Date, -2, -1)) %>%
  filter(Year >= "15" & Year <= "20") %>%
  group_by(Year) %>%
  select(Year, Category) %>%
  count(Category) %>%
  rename(Deaths = n) %>%
  gather(key = Category, value = Deaths)
  
ggplot(death_category_us) +
  geom_col(
    mapping = aes(x = Year, y = Deaths, fill = Category)
    ) +
  labs(
    title = "Number of Trans-Gender People Deaths per Year",
    y = "Number of Deaths"
  )