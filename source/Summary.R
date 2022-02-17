library("tidyverse")

care_agg <- read.csv("../data/Trans-Care-by-state-aggragate.csv")
care <- read.csv("../data/Trans-Care-by-state.csv")
crime <- read.csv("../data/hate_crime.csv")
fatality <- read.csv("../data/TDoR-Data-All.csv")
crime <- filter(crime, BIAS_DESC == "Anti-Transgender")
death_by_hc <- filter(fatality, Country == "USA") %>%
  filter(Category == "violence")
death_by_sc <- filter(fatality, Country == "USA") %>%
  filter(Category == "suicide")
in_summary <- list()

in_summary$avg_score <- gather(care_agg, key = State, value = Score, -Date) %>%
  group_by(State) %>%
  summarize(round(mean(Score), 2))

in_summary$death_by_hc_by_year <- mutate(death_by_hc, 
                              Date_2 = as.Date(Date, "%d-%b-%y")) %>%
  mutate(Year = format(Date_2, "%Y")) %>%
  group_by(Year) %>%
  summarize(n())
  
#Not valuable due to lack of data, trend noticed, but most likely due to increase of reporting
in_summary$death_by_sc_by_year <- mutate(death_by_sc, 
                              Date_2 = as.Date(Date, "%d-%b-%y")) %>%
  mutate(Year = format(Date_2, "%Y")) %>%
  group_by(Year) %>%
  summarize(n())

in_summary$hate_crime_by_year <- mutate(crime, 
                             Date_2 = as.Date(INCIDENT_DATE, "%d-%b-%y")) %>%
  mutate(Year = format(Date_2, "%Y")) %>%
  group_by(Year) %>%
  summarize(n())

in_summary$hate_crime_by_state <- group_by(crime, STATE_ABBR) %>%
  summarize(n())

in_summary$avg_score_year <- mutate(care_agg, Date_2 = as.Date(Date)) %>%
  mutate(Year = format(Date_2, "%Y")) %>%
  mutate(avg = rowMeans(select(care_agg, -contains("Date")))) %>%
  group_by(Year) %>%
  summarize(mean(avg))
  
