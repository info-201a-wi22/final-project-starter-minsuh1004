hate_crimes <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-minsuh1004/main/data/hate_crime.csv",
                        header = FALSE )
library("dplyr")
library("stringr")
library("tidyr")
library("tidyverse")
library(ggplot2)

hate_crimes <- hate_crimes %>%
  rename(NCIDENT_ID = V1,
         DATA_YEAR = V2 ,
         ORI = V3,
         PUB_AGENCY_NAME = V4,
         PUB_AGENCY_UNIT = V5,
         AGENCY_TYPE_NAME = V6,
         STATE_ABBR = V7,
         STATE_NAME = V8,
         DIVISION_NAME = V9,
         REGION_NAME = V10,
         POPULATION_GROUP_CODE = V11,
         POPULATION_GROUP_DESC = V12,
         INCIDENT_DATE = V13,
         ADULT_VICTIM_COUNT = V14,
         JUVENILE_VICTIM_COUNT = V15,
         TOTAL_OFFENDER_COUNT = V16,
         ADULT_OFFENDER_COUNT = V17,
         JUVENILE_OFFENDER_COUNT = V18,
         OFFENDER_RACE = V19,
         OFFENDER_ETHNICITY = V20,
         VICTIM_COUNT = V21,
         OFFENSE_NAME = V22,
         TOTAL_INDIVIDUAL_VICTIMS = V23,
         LOCATION_NAME = V24,
         BIAS_DESC = V25,
         VICTIM_TYPES = V26,
         MULTIPLE_OFFENSE = V27,
         MULTIPLE_BIAS = V28)
hate_crimes <- hate_crimes[-1,]
hate_crimes_trans <- hate_crimes  %>%
  filter(BIAS_DESC == "Anti-Gay (Male)")
table_by_state <- hate_crimes_trans %>%
  group_by(STATE_ABBR) %>%
  count()
library(ggplot2)
print(pie_chart_hatecrimes <- 
        ggplot(table_by_state, aes( x = "" , y = n, fill = STATE_ABBR)) +
        geom_col(color = "white") +
        labs(
          title = "Number of gay hate crimes by state",
          y = "Number of hate crimes",
          fill = "States Abbreviated"
        ) +
        coord_polar(theta = "y") 
)

