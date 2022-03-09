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
    mainPanel(),
    mainPanel(
      p("This project aims to draw attention to the lack of availability of trans 
        healthcare regarding medical transitioning, and transphobic hate crimes in relation to
        how it impacts the rates of trans suicide. One of the datasets we used detailed reported 
        crimes against trans victims. Our second dataset comes from the FBI records anti-trans 
        hate crimes. We can see a lot of empty data values, but this is a point we're aiming
        to emphasize: that there is an extreme lack of data on transphobic hate crimes. The 
        final data set used, compiled by one of the project members, recorded 
        anti-discrimination laws involving exclusion or inclusion of trans care."), 
      p("The major issues we're addressing include trans rights, trans suicides, 
        transitioning impacts, and trans hate crimes. We're hoping our dataset can
        answer how availability of trans healthcare and transphobic crimes impacts rates of trans 
        suicide. This information can be helpful for policymakers to
        make decisions ensuring equal opportunities and inform the community on the unjust
        treatment of the trans population. Trans rights is a social justice issue that needs 
        to be brought to light. The numbers and data displayed here quantitify just how dire 
        the situation is surrounding the transgender population."),
      img(src = "https://www.phila.gov/media/20190329155708/Transgender-Flag-700x400.jpg")
    )
  )
) 


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
    )
  )
)


page_three <- tabPanel(
  "Deaths",
  titlePanel("Death by Category"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "death_category",
        label =  "Different Categories of Trans-Gender Deaths",
        choices = c("Custodial", "Medical", "Suicide", "Uncategorised",
                    "Violence")
      )
    ),
    mainPanel(
      p("Reports of several deaths of Trans-Gender people has put a dramatic
        impact on how Trans people are treated by society. Using the Transgender
        Day of Remebrance (TDoR) data, we created a chart that displays the
        number of deaths reported in each year from 2015 to 2020 depending of
        the category of death that the victims have experienced. Figuring out
        the number of deaths reported per year may help really determine
        how Trans people are faring in modern society, especially in relation
        to trans-gender hate crimes."),
      plotlyOutput(outputId = "death_plot")
    )
  )
)

#Interactive 3 here: 
page_four <- tabPanel(
  "Trans Care By State and Year",
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "year",label = "Choose A Year: ",choices = 
                    c("2015" = 15,
                      "2016" = 16,
                      "2017" = 17,
                      "2018" = 18,
                      "2019" = 19,
                      "2020" = 20),selected = 15)),
    mainPanel(
      p("Trans care by state and year is a concept inspired by one of our members(faith) that took the time to maximise
        the ability for us to visualise our data. In the graph below each state receives a score 1 - 3 based on 3 variables.
        A point if a state passes a anti discriminatory law in private insurace, a point if a state passes a mandatory
        inclusion for transition care in private insurance,and a point if a state includes transition care in medicaid.But states also lost a point  
        when the exclusion of transition care in medicaid was true. This visualization allows for us to get an idea of how our country as a whole has 
        been evolving when it comes to passing laws in favor of trans care over the years.Its importants to understand that the data collected so far
        should be acknowledged because a span of 5 years is not a long time but this provides us with a promising foundation
        as substantial data will be added in the future."),
      plotOutput("plotpack"),
      )
   )
) 

# Summary Takeaways here: 
page_five <- tabPanel(
  "Takeaways",
  titlePanel("Summary Takeways"),
      p("1. clear throughout this project. Cases and incidents of hate crimes are
        underreported to state and federal agencies, the source of our death counts,
        including sucides, require people remorting and I do not beleive the number of
        sucide fatalities are that low, and the way we determined trans care avilbiltiy
        historicly is surface level and only goes back 5 years. Now, all of these failings
        could be adressed with time and effort: Going and collecting testimony from trans
        people all across america could solve the reporting issue, but that requries
        earning trust, and the errors in our dataset for avilibity of transision care
        could be done with extensive trawls of legistlative history of each state
        (Georgia copyrigths all their laws so that may be an issue) and of getitng 
        reports of trans people about how difficult it was when they started. And
        as you have hopefully seen from these interactabiles, particularly the
        reporting one, this has vastly impacted our project and it's reliablity.
        So, the biggest thing we took away from this is a cautionary
        tale of what happens when you have bad data and not enough time to fix
        it."),
      p("2. A general trend we've seen is an uptick in all of our data over time
        which is to be expected. Because as trans people become more accepted, 
        they're (we're -Faith) transision related care will become more avilible
        as old gatekeeping goes by the wayside, but also it means that hate crimes
        and suicides that would have been swept under the rug now have a better
        chance of being reported. Now this doesn't disprove our hypothisis, but
        it doesn't prove it either; when you only have 6 data points (reported suicides) for a period
        of 20 years and 50 states, you can't make arguments based on trends. So
        the second takeway is that we still need to work more to use data science to
        prove this hypothisis. So right now, we're left with the common sense of
        if you're visible, you're a better target, and life's better when you
        don't hate your body."),
      p("3. Now, just looking at the reported hate crimes, the places you (or 
        at I -Faith) expect to report higher amounts of hate crimes were some
        of the lowest, and vise versa. Caifornia reports 206 while South Carolina
        Reports 5 total hate crimes, and if you take a look at Washington and
        North Carolina you see that Washington seems to have more anti-trans hate
        crimes per trans capita. So what's up there? Well, that leads us to the 
        last take away, to use a chapter title from Data Feminism, 'what gets
        counted counts'. Just think for a second, California and Washington, two
        firmly democrat controled states (a party who are at least non-hostile to trans
        people) report more hate crimes than the carolinas which are very conservative
        (which is a party much more hostile to trans people), how does this make sense
        are conseravtive controled states more friendly to trans people? *or* are
        the officails there just more likely to not report transphobic hate crimes?
        What isn't said is just as important as what is.")
  )

# Report Page here: reiterate PO1 & PO2
page_six <- tabPanel(
  "Report",
  titlePanel("Report Page"),
  h3("Trans Rights Research"),
  p("Authors: Minsuh Kim- msk812@uw.edu, Faith Greene- bag01@uw.edu, 
Hana Pham- hana pham@uw.edu, Fila Mohamed- fila10@uw.edu"),
  p("Affiliation: INFO-201- Techinical Foundations of Informatics, The Information
School, University of Washington"),
  p("Date: March 5th, 2022"), 
  p("Abstract: Our main addressing question is how the availability of trans 
healthcare regarding medically transitioning, as well as transphobic hate crimes, 
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
mentioned to the rate of suicide in the trans community."),
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
the data confirmed the obvious answer we knew: the detrimental mental health 
outcomes like suicide see increasing numbers. The transgender community's inability
to fully transition has detrimental negative impacts on their mental health. 
Something we noticed was how limited our data sets were. This lack of data just shows how little attention there is  
surrounding obstacles that the transgender community face. We can see that hindering someone's ability
to access the medical tools and support to continue their journey into becoming who they
are has only negative outcomes that may be irreversible."), 
  p("6.0 Discussion: The most significant implication of our findings is that there
must be something done to ensure that the transgender community get the equal rights
they deserve. A continued lack of action will result in a continuous influx of trans
suicide rates. To draw more attention to this issue, however, we need to see more
data drawn towards these issues. Not enough data is recorded, as we found
out when compiling datasets. If there were more records, this would imply more people
are researching this topic and caring enough to compile datasets. The more attention there
is, then the greater reason to incite change."),
  p("7.0 Conclusion: If there were a takeaway one could take from reading this 
report, it would be that the transgender community continues to suffer and not receive 
the equal rights they clearly deserve. The obvious lack of data we experienced when
compiling our project just shows how little attention there is on this crucial
societal problem. Not one more person should be suffering because they aren't able to
freely be who they want. Every transgender person deserves the medical attention they need,
the mental health resources, and the equal rights as like everyone else in the world."),
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
  https://www.hrc.org/resources/understanding-the-transgender-community")
)

ui <- fluidPage(navbarPage( 
  "Trans Rights Research",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six),
  tags$style(HTML(
    '
        body {
            width: 100%;
            margin: auto;
            background-image: url("bkg.jfif");
        }

        h1 {
            text-align: center;
        }

        #title {
            display: block;
            margin: auto;
            height: auto;
            max-width: 100%;
        }
        .navbar{
          background-color: #0ab0f2;
        }
        li a{
            list-style-type: none;
            color: #fa78d9;
            margin: 0;
            padding: 0;
            overflow: hidden;
            border-right: 2px solid #fa78d9;
            border-left: 2px solid #fa78d9;
            background-color: #0ab0f2;
        }
        
        a{
          color: #fa78d9;
        }
    '
  ) )
) 
