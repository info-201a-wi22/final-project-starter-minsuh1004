#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

page_one <- tabPanel(
  "Introductory Page",
  titlePanel("Introduction"), 
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
) 

#Interactive 1 here:
page_two <- tabPanel()

#Interactive 2 here:
page_three <- tabPanel()

#Interactive 3 here: 
page_four <- tabPanel() 

# Summary Takeaways here: 
page_five <- tabPanel()

# Report Page here: reiterate PO1 & PO2
page_six <- tabPanel() 



