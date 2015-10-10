# library(shiny)
# setwd("D:\\_GIT_\\Developing_Data_Products")
# setwd("D:\\_MOOC_\\git\\Developing_Data_Products")
# runApp()

library(shiny)

shinyUI(pageWithSidebar(
   headerPanel('Portugues Students data'),
   sidebarPanel( width = 12,
      selectInput("data", 
                label = "Choose the students data",
                choices = list("Portugues","Math"),
                selected = "Portugues"
      ),
      p(""),p(""),p(""),
      br("The data source :"),
      a("UC Irvine Machine Learning Repository", href="https://archive.ics.uci.edu/ml/datasets/Student+Performance")
      #download data source
   ),
   mainPanel(
      tabsetPanel(
         tabPanel( "Histograms", 
                   textOutput("selected"), 
                   plotOutput("ageHist")
         ),
         tabPanel( "Browse data", 
                   textOutput("showed"),
                   dataTableOutput(outputId="theDataSelected")
         ),
         tabPanel("Source ands data informations", includeHTML("./html/source.html")
         )
         
      )
   )
))
