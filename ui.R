# library(shiny)
# setwd("D:\\_GIT_\\Developing_Data_Products")
# setwd("D:\\_MOOC_\\git\\Developing_Data_Products")
# runApp()

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Portugues Students data"),
  
  sidebarPanel(
    h3('look at the histogram')
  ),
  
  mainPanel(
    h3('here  it is the age histogram'),
    plotOutput('ageHist')
  )
))
