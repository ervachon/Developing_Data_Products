library(shiny)
library(RCurl)
library(ggplot2)

loadCSV <- function(URL) {
  csv <- tryCatch( {read.csv(text=getURL(URL,ssl.verifypeer=0L, followlocation=1L),sep=';')},
                          error=function(cond) {return(read.csv(URL))})    
  return(csv)
}

shinyServer(
  function(input, output) 
  {
    studentData     <- loadCSV("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/student/student-por.csv") 
    studentData$ageLevel <- as.factor(studentData$age)
    
    output$ageHist  <- renderPlot(
      ggplot(studentData, aes(x=ageLevel,fill=sex))
           + geom_bar(binwidth=.5,position="dodge")
           + facet_grid(school ~ . )
           + xlab ("Age of the students")
  )

  }
)