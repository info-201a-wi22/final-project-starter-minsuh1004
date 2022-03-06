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
page_four <- tabPanel(
  titlePanel("Interactive 3 Title HERE"),
) 

# Summary Takeaways here: 
page_five <- tabPanel(
  titlePanel("Summary Takeaways"), 
)

# Report Page here: reiterate PO1 & PO2
page_six <- tabPanel(
  titlePanel("Report Page"),
  h3("Trans Rights Research"),
  p("Authors: Minsuh Kim- msk812@uw.edu, Faith Greene- bag01@uw.edu, 
Hana Pham- hana pham@uw.edu, Fila Mohamed- fila10@uw.edu"),
  p("Affiliation: INFO-201- Techinical Foundations of Informatics, The Information
School, University of Washington")
  p("Date: March 5th, 2022"), 
  p("Abstract: Our main addressing question is how the availability of trans 
healthcare regarding medically transitioning as well as transphobic hate crimes 
impacts rates of trans suicides. This is essential because data surrounding 
the transgender community are often unknown to the general populous, therefore
increasing the wealth of data available will help continue the fight for trans rights.
To address this concern, we plan to look at available data sets and analyze if rates
of suicide and hate crimes change before and after, in a place, and with or 
without the availability of transition healthcare."),
  p("Keywords: Trans Rights, Trans Suicide, Medical Transitioning Impacts, 
    Trans Hate Crimes"),
  p("1.0 Introduction: Our project takes on problems surrounding trans rights and
their overall livelihood in the United States. The transgender community has")
  p("2.0 Design Situation: )
  p("3.0 Research Questions: )
  p("4.0 The DataSet: ")
  p("5.0 Findings: answers to research question...")
  p("6.0 Discussion: important/implication of finding...")
  p("7.0 Conclusion: summary point, key point to leave audience with...")
  p("Acknowledgement: ")
  p("References: ")
  
  
  
  
  p("Our Trans Rights Research project takes on the overall livelihood of the 
trans community. It focuses on the hardships and discrimination this community
has had to face, and draw attention lack of action being taken to change that.
The trans population has struggled against hate crimes, a lack of medical resources
and support for transitioning, and an influx of suicides. This is not okay and it's 
the exact reason why we've chosen this as our topic of research. As we framed this 
project, the main topic of concern was
    ")




ui <- navbarPage(
  "Trans Rights Research",
  page_one, page_two, page_three, page_four, page_five
  page_six) 
