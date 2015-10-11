# library(shiny)
# setwd("D:\\_GIT_\\Developing_Data_Products")
# setwd("D:\\_MOOC_\\git\\Developing_Data_Products")
# runApp()

library(shiny)
library(rCharts)
library(manipulate)

shinyUI(pageWithSidebar(
   headerPanel(HTML('Developing Data Products Project<h2>Eric VACHON<h3>October 2015')),
   sidebarPanel( #width = 12,
      selectInput("data", 
                label = "Choose the students data",
                choices = list("Portugues","Math"),
                selected = "Portugues"
      ),
      br(),br(),br(),br(),
      p("The data source : "),
      a("UC Irvine Machine Learning Repository", 
        href="https://archive.ics.uci.edu/ml/datasets/Student+Performance"),
      br(),
      a("(Download source)", 
         href="https://archive.ics.uci.edu/ml/machine-learning-databases/00320/student.zip")
   ),
   mainPanel(#width = 12,
      tabsetPanel(
        tabPanel("Documentation"                , includeHTML("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/html/documentation.html")),
        tabPanel("Source ands data informations", includeHTML("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/html/source.html")),
        tabPanel("Histograms"                   , textOutput("selected"), plotOutput("ageHist")),
        tabPanel("Browse data"                  , textOutput("showed"), dataTableOutput(outputId="theDataSelected"))
         
        )
      )
   )
)