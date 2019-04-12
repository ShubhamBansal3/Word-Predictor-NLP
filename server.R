
library(shiny)

getwd()

source("Input.R", local = TRUE)
library(sqldf)
library(RSQLite)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  TextPrediction<- reactive({

    CleanInput<- input$caption
    
    if(length(Input(CleanInput))==0){
      "Please input some text"
    }else{
    Input(CleanInput)[1]
    }
  })
  
  TextPrediction2<- reactive({
    
      CleanInput<- input$caption
      
      if(length(Input(CleanInput))==0){
        "Please be lenient"
      }else if(is.na(Input(CleanInput)[2]))
               {
        " "
      }
      else{
        Input(CleanInput)[2]
      }
    })
  
  output$caption <- renderText({
    TextPrediction()
  })
  
  output$caption1 <- renderText({
    TextPrediction2()
  })
  
  
})
