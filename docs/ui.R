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
their overall livelihood in the United States. The transgender community has been subjected
to oppression in many forms. We as a group have decided to shed light on issues 
specifically in the trans community that is affected by outside factors. Some of these
include hate crimes and lack of medical resources or support related to the individual's
choice of transitioning. We're hoping to connect and compare these outside factors 
mentioned to the rate of suicide in the trans community.")
  p("2.0 Design Situation: 
  - Framing the topic of concern: The topic of concern in the effect of the availability
of trans healthcare on the trans population concerning trans suicides. A key element
would be trans rights. A lack of these rights is solely a social justice problem that
hinders trans peoples' ability to transition fully. 
 - Human Values: The principal human value we're emphasizing is equal rights and 
accepting people for who they are. These values come from providing trans people with
the medical tools and access to transition to being who they are. Again, we chose this topic
to draw attention to the issues of discrimination against the transgender community.
 - Stakeholders: The direct stakeholders of our topic are the general population. 
We're motivated to raise awareness on injustices towards trans people, resulting in 
increasing number of suicides. We're also drawing attention to the problems surrounding
the lack of availability of trans healthcare. Indirect stakeholders could be policymakers
who can make a difference in making healthcare more accessible. Other stakeholders include
those within the medical field. Doctors or nurses all within the profession have the voice
and access to create some change and advocacy for trans people. By displaying all this
info, it may encourage some advocates within the work field to open up the possibilities
of change.
 - Benefits & Harms: A potential benefit would be a change surrounding the availability
of trans healthcare. If this information were to incite any positive outome, this would
be by far the greatest. It would mean that the data we presented provoked some 
feelings of action and realization that something must change. That means it reached every
audience we intended to target: policy makers, doctors, the general population and
medical professionals. Some unanticipated consequences could be that our presentation of
data doesn't motivate the effort that we hoped would happen. In other words, there 
continues to be no advocation towards equality for trans people."), 
  p("3.0 Research Questions: 
  Q.1- How does limited access to medical care for the trans population affect
their transitioning process and mental health?
Q.2- What is the result of many trans hate crimes on suicide rates among the 
transgender community?
Q.3- What opinions and perspectives on equal medical access rights for the transgender
population can we infer based on the number of successful transition stories?
Q.4- What effect will this data on suicide rates, trans hate crimes, and lack of medical
accessibility for transitioning have on society's response to these issues?"), 
  p("4.0 The DataSet: We currently have 3 datasets. Our first dataset comes courtest
of the Trans Day of Remembrance organization that consolidated data from the Trans
Murder Monitoring Project and Transgender Europe. Of all the datasets, this is one we
trust the most, as it was collected with the purpose of furthering transgender rights
all over the world. Now the data has over 4000 entires, with 21 data points per entry.
This is especially haunting because some of these points detailed move information about
trans victims. This data is all reported deaths. We don't know how many victims died that
just weren't reported or the recorded report got lost. Not to mention, those that haven't
come out as transgender that have died won't be reported in this dataset. Therefore, this 
can make our data seem incomplete. Our second dataset comes from the FBI and it records
hate crimes since 1991. It contains 28 data points and over 1000000 entires. We're only
paying attention to the data about anti-trans hate crimes. Unfortunately, this type of
data was recorded after 2014, so again, we're missing a lot of data. Since the FBI is 
our source, many hate crimes committed by the police are most likely not recorded. The final 
dataset was compiled by one of our group members, Faith Greene from this site- 
https://www.lgbtmap.org/equality-maps/healthcare_laws_and_policies.  It approximates dates
or all 50 states and territories on healthcare for the transgender population. The time 
we had for this project was limited so it was difficult to create such an extensive
data set. We had to use an imprecise method because there are so few datasets on the
history of this subject. The only things recorded were private insurace anti-driscrimination
laws, laws for or against the exclusion of trans-specific care for private insurance, 
and whether Medicaid provided trans-specific care. Many other aspects weren't accounted
for with this dataset such as how many people have access to insurance or the amount of 
available doctors in an area. Were we to have more time to spend on compiling this final
data set, it may be much better and contain much more data."), 
  p("5.0 Findings: The greatest finding we got from doing this research project was
that the transgender community continues to suffer at the hand of ignorance and hate 
of people that refuse to accept people for who they are. We wanted to know how lack 
of medical care and hate crimes against trans people affect their mental health. Seeing 
the data solidified the obvious answer we knew: the detrimental mental health 
outcomes like suicide see increasing numbers. Something we noticed was how limited 
our data sets were. This lack of data just shows how little attention there is to 
obstacles that the transgender community face. We can see that hindering someone's ability
to access the medical tools and support to continue their journey into becoming who they
are has only negative outcomes that may be irreversible."), 
  p("6.0 Discussion: The most significant implication of our findings is that there
must be something done to ensure that the transgender community get the equal rights
they deserve. A continued lack of action will result in a continuous influx of trans
suicide rates. To draw more attention to this issue, however, we need to see more
data drawn towards these issues. Not enough data is recorded, as we found
out when compiling datasets. If there were more records, this would imply more people
are researching this topic and caring enough to compile datasets. The more attention there
is, then the greater reason to incite change.")
  p("7.0 Conclusion: If there were a takeaway one could take from reading this 
report, it would be that the transgender community continues to suffer and not receive 
the equal rights they clearly deserve. The obvious lack of data we experience when
compiling our project just shows how little attention there is on this crucial
societal problem. Not one more person should be suffering because they aren't able to
freely be who they want. Every transgender person deserves the medical attention they need,
the mental health resources, and the equal rights just like everyone else in the world."),
  p("Acknowledgement: We would like to thank our peers for helping us find some 
    data sets."), 
  p("References: 
  - Study shows shocking rates of attempted suicide among Trans Teens. HRC. (n.d.). 
  https://www.hrc.org/news/new-study-reveals-shocking-rates-of-attempted-suicide-among-trans-adolescen)
  - Unger, C. A. (2016, December). Hormone therapy for transgender patients. Translational andrology and urology. 
  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5182227/
  - Rangel, A. (2022, February 2). A blueprint for reform: Police and transgender rights.
  The Crime Report. https://thecrimereport.org/2022/02/02/a-blueprint-for-reform-police-and-transgender-rights/
  - Understanding the transgender community. HRC. (n.d.). 
  https://www.hrc.org/resources/understanding-the-transgender-community"), 
  
 


ui <- navbarPage(
  "Trans Rights Research",
  page_one, page_two, page_three, page_four, page_five
  page_six) 
