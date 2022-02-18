trans_care <- read.csv("../data/Trans-Care-by-state.csv")
hate_crime <- read.csv("../data/hate_crime.csv")
people_data <- read.csv("../data/TDoR-Data-All.csv") 


#install.packages("plotly") 
library("plotly")
library("ggplot2")


victim_count_plot <- ggplot(hate_crime) + 
    geom_point(mapping = aes(x = DATA_YEAR, y =  VICTIM_COUNT, color = REGION_NAME)) +
  labs(title = "Victim Count by Region", 
       x = "Year",
       y = "Number of Victims")
print(victim_count_plot)
