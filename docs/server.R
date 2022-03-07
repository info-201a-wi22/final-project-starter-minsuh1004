#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("tidyverse")
server <- function(input, output) {
  output$report <- renderText({
    census <- read.csv("../data/Census_data.csv")
    crime_stat <- read.csv("../data/Attempt_to_Quantify_reporting.csv")
    q_pop <- read.csv("../data/Queer-pop-by-percent.csv")
    st <- input$state_id
    c_filtered <- filter(census, NAME == st)
    c_filtered[2,] <- census[1,]
    cs_filtered <- filter(crime_stat, State == st)
    qp_filtered <- filter(q_pop, State.or.territory == st)
    count <- 1 #may change
    tot <- 0
      count <- count + 4
      tot <- tot + (select(cs_filtered,
                           Anti.American.Indian.or.Alaska.Native)[[1,1]] /
        sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                             "American Indian")][1,])))
      tot <- tot + (select(cs_filtered,
                           Anti.Asian)[[1,1]] /
        sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                              "Asian")][1,])))
      tot <- tot + (select(cs_filtered,
                           Anti.Black.or.African.American)[[1,1]] /
                      sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                                "African American")][1,])))
      tot <- tot + ((select(cs_filtered,
                           Anti.Other.Race.Ethnicity.Ancestry)[[1,1]] +
                       select(cs_filtered,
                              Anti.Hispanic.or.Latino)[[1,1]]) /
                      sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                                      "Other")][1,])))
    qpop <- ((as.numeric(c_filtered[[1,4]])*
             (as.numeric(str_split_fixed(qp_filtered[[1,4]], "\\%", 2)[1])
              / 100)))
    tot <- tot + ((select(cs_filtered,
                          Anti.Lesbian..Gay..Bisexual..or.Transgender..Mixed.Group.)[[1,1]] +
                     select(cs_filtered, Anti.Bisexual)[[1,1]] + 
                     select(cs_filtered, Anti.Transgender)[[1,1]] +
                     select(cs_filtered, Anti.Lesbian..Female.)[[1,1]] +
                     select(cs_filtered, Anti.Gender.Non.Conforming)[[1,1]]))/qpop
    state_avg <- tot/count
    trans_report <- select(cs_filtered, Anti.Transgender)[[1,1]] /
      (as.numeric(c_filtered[[1,4]]) * 
         (as.numeric(str_split_fixed(qp_filtered[[1, ncol(qp_filtered)]],
                                     "\\%", 2)[1])
    / 100))
    return(str_glue("The average rate of reports for the state is ",
                    round(state_avg,7)*100, "% as compared to ",
                    round(trans_report,7)*100,"% for just trans people"))
  })
  
  output$report_plot <- renderPlot({
    census <- read.csv("../data/Census_data.csv")
    crime_stat <- read.csv("../data/Attempt_to_Quantify_reporting.csv")
    q_pop <- read.csv("../data/Queer-pop-by-percent.csv")
    st <- input$state_id
    c_filtered <- filter(census, NAME == st)
    c_filtered[2,] <- census[1,]
    cs_filtered <- filter(crime_stat, State == st)
    qp_filtered <- filter(q_pop, State.or.territory == st)
    count <- 5 #may change
    tot <- 0
    anti_ai <- (select(cs_filtered,
                         Anti.American.Indian.or.Alaska.Native)[[1,1]] /
                    sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                                         "American Indian")][1,])))
    tot <- tot + anti_ai
    anti_a <- (select(cs_filtered,
                         Anti.Asian)[[1,1]] /
                    sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                                         "Asian")][1,])))
    tot <- tot + anti_a
    anti_aa <- (select(cs_filtered,
                         Anti.Black.or.African.American)[[1,1]] /
                    sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                                         "African American")][1,])))
    tot <- tot + anti_aa
    anti_other <- ((select(cs_filtered,
                          Anti.Other.Race.Ethnicity.Ancestry)[[1,1]] +
                     select(cs_filtered,
                            Anti.Hispanic.or.Latino)[[1,1]]) /
                    sum(as.numeric(c_filtered[str_detect(c_filtered[2, ],
                                                         "Other")][1,])))
    tot <- tot + anti_other
    qpop <- ((as.numeric(c_filtered[[1,4]])*
                (as.numeric(str_split_fixed(qp_filtered[[1,4]], "\\%", 2)[1])
                 / 100)))
    anti_queer <- ((select(cs_filtered,
                          Anti.Lesbian..Gay..Bisexual..or.Transgender..Mixed.Group.)[[1,1]] +
                     select(cs_filtered, Anti.Bisexual)[[1,1]] + 
                     select(cs_filtered, Anti.Transgender)[[1,1]] +
                     select(cs_filtered, Anti.Lesbian..Female.)[[1,1]] +
                     select(cs_filtered, Anti.Gender.Non.Conforming)[[1,1]]))/qpop
    tot <- tot + anti_queer
    state_avg <- tot/count
    trans_report <- select(cs_filtered, Anti.Transgender)[[1,1]] /
      (as.numeric(c_filtered[[1,4]]) * 
         (as.numeric(str_split_fixed(qp_filtered[[1, ncol(qp_filtered)]],
                                     "\\%", 2)[1])
          / 100))
    Bias <- c("Anti-Native-American", "Anti-Asian", "Anti-African-American",
              "Anti-Other-Race", "Anti-LGBT", "Anti-Trans", "State-Avg")
    Percent <- c(anti_ai * 100, anti_a * 100, anti_aa * 100, anti_other * 100,
                 anti_queer * 100, trans_report * 100, state_avg * 100)
    new_df <- data.frame(Bias, Percent)
    plot <- ggplot(data = new_df) +
      geom_col(mapping = aes(x = Bias, y = Percent))
    print(plot)
  })
}