trans_care <- read.csv("../data/Trans-Care-by-state.csv")
hate_crime <- read.csv("../data/hate_crime.csv")
people_data <- read.csv("../data/TDoR-Data-All.csv") 



install.packages(plotly)
library(plotly)
library(ggplot2)

# Data Visualization:  

victim_count_by_year <-
  ggplot(data = hate_crime) + 
    geom_point(mapping = aes(
      x = DATA_YEAR, y =  VICTIM_COUNT, color = REGION_NAME)
    ) 
   
 
 

  
