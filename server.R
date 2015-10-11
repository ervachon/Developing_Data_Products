library(shiny)
library(RCurl)
library(ggplot2)
library(caret)

theURL <-"https://archive.ics.uci.edu/ml/datasets/Student+Performance"

loadCSV <- function(URL) {
  csv <- tryCatch( {read.csv(text=getURL(URL,ssl.verifypeer=0L, followlocation=1L),sep=';')},
                          error=function(cond) {return(read.csv(URL))})    
  return(csv)
}

SelectStudentData <- function(theData){
  if (theData == "Portugues") {
    studentData     <- loadCSV("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/student/student-por.csv")   
  } else {
    studentData     <- loadCSV("https://raw.githubusercontent.com/ervachon/Developing_Data_Products/gh-pages/student/student-mat.csv")   
  }
  
  studentData$ageLevel <- as.factor(studentData$age)
  return(studentData)
  
}

theColors <- function(indice){
  col <- array(data <- c("red", "orange", "blue", "green", "brown", "yellow", "pink"))
  return(col[as.integer(indice)])
} 

myPredict <- function(myData){
  inTrain           <- createDataPartition(y=myData$G3, p=.8, list = FALSE)
  ourTrain          <- myData[inTrain,]
  ourTest           <- myData[-inTrain,]
  modelFit          <- train(ourTrain$G3 ~ ., method = "glm",data=ourTrain)
  testPred          <- predict(modelFit,ourTest)
  results           <- cbind(ourTest$G3,testPred)
  colnames(results) <- c("Reference", "Prediction")
  return(as.data.frame(results))
}

shinyServer(
  function(input, output) {    
    set.seed(12345)
        
    myData <- reactive({SelectStudentData(input$data)})
    
    output$selected        <- renderText({ paste("You have selected : ", input$data)})
    output$showed          <- renderText({ paste("Data : ", input$data)})
    output$theDataSelected <- renderDataTable({data <- myData()})
    output$ageHist         <- renderPlot(ggplot(myData(), aes(x=ageLevel,fill=sex))
                                            + geom_bar(binwidth=.5,position="dodge")
                                            + facet_grid(school ~ . )
                                            + xlab ("Age of the students")
                                            + scale_fill_manual(values=c( theColors(input$col1), theColors(input$col2)))
                                         )
    
    myPred       <- reactive({myPredict(myData())})
    output$pred <- renderPlot( ggplot(myPred(), aes(x = Reference, y = Prediction)) 
                                   + geom_point(color='blue')
                                   + geom_abline(intercept=0,slope=1,colour='red') 
                                   + geom_smooth(color = 'green')
                             )
  }
)