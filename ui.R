#
#
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Dynamic Sliders Example"),
    
    # Sidebar with a slider input 
    sidebarLayout(
        sidebarPanel(
            textInput(inputId = "slider_names",
                label = "Enter slider names, separated by any punctuation", 
                value = ""),
            uiOutput("my_sliders")
        ),
        
    
        # Show a plot of the generated distribution
        mainPanel(
            fluidRow(
                column(width = 6,
                    DT::dataTableOutput("slider_values")
                ),
                column(width = 6,
                    helpText("This app provides a quick and simple example illustrating how to implement dynamically rendering slider inputs in Shiny.  Upon tackling this problem for a recent client project, I realized although relatively simple to implement, it is not a trival problem.  Thus I created this app to help my colleagues potentially navigate and tackle this problem if they ever encounter it.")
                )
            )
        )
    )
))
