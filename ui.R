# library(shiny)
# setwd("D:\\_GIT_\\Developing_Data_Products")
# runApp()

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("test inputs"),
  sidebarPanel(
    textInput(inputId='in1', label='le premier'),
    textInput(inputId='in2', label='le deuxieme')
  ),
  mainPanel(
    h3('Illustrating outputs'),
    h4('res 1 :'), verbatimTextOutput('out1'),
    h4('res 2 :'), verbatimTextOutput('out2'),
    h4('res 3 :'), verbatimTextOutput('out3')
  )
))
