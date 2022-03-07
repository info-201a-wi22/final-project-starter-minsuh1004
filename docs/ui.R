#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("plotly")
c <- read.csv("../data/Census_data.csv")
page_one <- tabPanel(
  "Introductory Page",
  titlePanel("Introduction"), 
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
  p("This project aims to draw attention to the lack of availability of trans 
healthcare regarding medical transitioning and how it impacts the rates of trans
suicide and transphobic hate crimes. One of the datasets we used detailed reported 
crimes against trans victims. Our second dataset comes from the FBI records anti-trans 
hate crimes. We can see a lot of empty data values, but this is a point we're aiming
to emphasize: that there is an extreme lack of data on transphobic hate crimes. The 
final data set used, compiled by one of the project members, recorded 
anti-discrimination laws involving exclusion or inclusion of trans care."), 
  p("The major issues we're addressing include trans rights, trans suicides, 
transitioning impacts, and trans hate crimes. We're hoping our dataset can
answer how availability of trans healthcare impacts rates of trans 
suicide and transphobic crimes. This information can be helpful for policymakers to
make decisions ensuring equal opportunities and inform the community on the unjust
treatment of the trans population. Trans rights is a social justice issue that needs 
to be brought to light. The numbers and data displayed here quantitify just how dire 
the situation is surrounding the transgender population."),
img(src = "https://www.phila.gov/media/20190329155708/Transgender-Flag-700x400.jpg")
))) 

#Interactive 1 here:
page_two <- tabPanel(
  "Reporting",
  titlePanel("Reporting, a massive problem"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "state_id", label = "state",
                  choices = c$NAME[2:length(c$NAME)]),
    ),
    mainPanel(
      "Now, it's",
      tags$a(herf = "https://news.northeastern.edu/2021/08/23/why-hate-crimes-are-underreported-and-what-police-departments-have-to-do-with-it/", "well"),
      tags$a(herf = "https://www.policechiefmagazine.org/the-hate-crimes/", " known "),
      tags$a(herf = "https://journals.sagepub.com/doi/full/10.1177/0002764218823844", "fact"),
      "that hate crimes are often under reported, which
        puts answering these research questions in a bit of bind, as it means
        we cannot trust our data. So using census data, the results of a", 
      tags$a(herf = "https://news.gallup.com/poll/203513/vermont-leads-states-lgbt-identification.aspx", 
             "2016 gallup poll "), 
        "and a",
      tags$a(herf = " https://williamsinstitute.law.ucla.edu/publications/trans-adults-united-states/", "report from the Williams Institute of law at UCLA "),
        "alongside the data from the FBI we are using for hate crimes, we made
        this: a way to see what percentage of various minorites report experiencing
        hate crimes in each state. Now this alone isn't conclusive of anything
        but using what you know of each state and/or researching them along with
        this, it may be able to detirmine if anti-trans hate crimes might be 
        esspecially under reported.",
      textOutput(outputId = "report"),
      plotOutput(outputId = "report_plot")
)))

#Interactive 2 here:
page_three <- tabPanel()

#Interactive 3 here: 
page_four <- tabPanel() 

# Summary Takeaways here: 
page_five <- tabPanel(
  "Takeaways",
  titlePanel("temp"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
  p("1. There is a clear issue with our information gathering. Now while our
    sources are reliable, they are not infalible, and that is made extremely
    clear throughout this project. Cases and incidents of hate crimes are
    underreported to state and federal agencies, I do not beleive the number of
    sucide fatalities are that low. So the big take away should be that, when it
    comes to issues like these, there isn't enough aviable data to do a data
    driven approach without doing rigourus data collection yourself"),
  p("2."),
  p("3.")
)))

# Report Page here: reiterate PO1 & PO2
#page_six <- tabPanel() 

  navbarPage(
    "Navigation",
    page_one,
    page_two,
    page_three,
    page_four,
    page_five,
    page_six
  )
