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
                    helpText("Document explanation will go here")
                )
            )
        )
    )
))
