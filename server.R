library(shiny)


loadCSV <- function(URL) {
  csv <- tryCatch({read.csv(text=getURL(URL,ssl.verifypeer=0L, followlocation=1L))},
                  error=function(cond) {return(read.csv(URL))})    
  return(csv)
}

shinyServer(
  function(input, output) 
  {
    myData <- loadCSV("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv") 
    
    x <- reactive({as.numeric(input$in1)+100})
    
    output$out1 <- renderText({x()})
    output$out2 <- renderText({x() + as.numeric(input$in2)})
    output$out3 <- renderText({as.numeric(input$in1)+as.numeric(input$in2) + 100 })
  }
)