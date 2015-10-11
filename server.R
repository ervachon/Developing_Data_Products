library(shiny)
library(RCurl)
library(ggplot2)

theURL <-"https://archive.ics.uci.edu/ml/datasets/Student+Performance"

loadCSV <- function(URL) {
  csv <- tryCatch( {read.csv(text=getURL(URL,ssl.verifypeer=0L, followlocation=1L),sep=';')},
                          error=function(cond) {return(read.csv(URL))})    
  return(csv)
}

SelectStudentData <- function(theData){
  
  if (theData == "Portugues") 
  {
    studentData     <- loadCSV("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/student/student-por.csv")   
  }
  else
  {
    studentData     <- loadCSV("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/student/student-mat.csv")   
  }
  
  studentData$ageLevel <- as.factor(studentData$age)
  return(studentData)
  
}


shinyServer(
  function(input, output) {
    output$selected <- renderText({ paste("You have selected : ", input$data)})
    output$showed   <- renderText({ paste("Data : ", input$data)})
    
    myData <- reactive(SelectStudentData(input$data))
    
    output$theHTML         <- renderUI({getPage()})
    output$theDataSelected <- renderDataTable({data <- myData()})
    output$ageHist         <- renderPlot(ggplot(myData(), aes(x=ageLevel,fill=sex))
                                            + geom_bar(binwidth=.5,position="dodge")
                                            + facet_grid(school ~ . )
                                            + xlab ("Age of the students")
         )

  }
)