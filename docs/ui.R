#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# what major questions you want to answer, what data you use to answer
page_one <- tabPanel(
  "Introductory Page",
  titlePanel("Introduction"), 
  p("This project aims to draw attention to the lack of availability of trans 
healthcare regarding medically transitioning and how it impacts the rates of trans
suicide and transphobic hate crimes. One of the datasets we used detailed reported 
crimes against trans victims. Our second dataset from the FBI records anti-trans 
hate crimes 


