library(stringr)
library(dplyr)
library(ggplot2)
library(tidyr)
tran_care <- read.csv("../data/Trans-Care-by-state-aggragate.csv",stringsAsFactors = FALSE)
#2020,12,31
#2019,12,31
#2018,12,31
#2017,12,31
#2016-12-31
#2015-12-31
twenty_15_data <- tran_care %>%
                          filter(Date == "2015-12-30")

twenty_16_data <- tran_care %>%
  filter(Date == "2016-12-30")

twenty_17_data <- tran_care %>%
  filter(Date == "2017-12-30")

twenty_18_data <- tran_care %>%
  filter(Date == "2018-12-30")

twenty_19_data <- tran_care %>%
  filter(Date == "2019-12-30")

twenty_20_data <- tran_care %>%
  filter(Date == "2020-12-30")
#example 2020 data frame to plot
long_data_set <- pivot_longer(twenty_15_data,cols = -Date)
long_data_set <- long_data_set %>%
                    select(name,value)

ggplot(long_data_set,aes(x = name, y = value)) +
  geom_segment(aes(x = name, xend = name,y = 0, yend = value, color = name)) +
  geom_point() +
  labs (
    color = "States",
  )
  
