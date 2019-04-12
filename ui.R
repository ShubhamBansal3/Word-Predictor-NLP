library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(
        
        fluidPage(theme = shinytheme("united"),
  headerPanel("Word Prediction"),
  
  sidebarLayout(
  
  sidebarPanel(
    textInput("caption", "Input:", "Start Typing...")
    # submitButton("Update!"),
    # p("Click on Update Button for Results")
    ),
    
    mainPanel(
      p("Prediction1"),
      verbatimTextOutput("caption"),
      
      p("Prediction2"),
      verbatimTextOutput("caption1")
  )
  )
)
)
