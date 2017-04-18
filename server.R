#
#
#

library(shiny)
library(dplyr)
library(stringr)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # create set of slider names
    names_sliders <- reactive({
        unlist(str_extract_all(input$slider_names, "[a-z]+"))
    })
   
    # create sliders
    output$my_sliders <- renderUI({
        validate(
            need(names_sliders(), "Enter slider names.")
        )
        my_names <- names_sliders()
        lapply(seq(length(my_names)), function(i) { 
            sliderInput(inputId = paste(my_names[i]),
                label = my_names[i], 
                min = 0, max = 10, value = 5)
        })
    })
    
    # read sliders into data frame
    tbl_sliderValues <- reactive({
        validate(
            need(names_sliders(), "Enter slider names.")
        )
        my_names <- names_sliders()
        my_sliderValues <- sapply(seq(length(my_names)), 
            function(i) {
                eval(parse(text = paste0("input$", my_names[i])))
            }
        )
        data.frame(
            slider_name = my_names,
            slider_value = my_sliderValues
        )
    }) 
    
    # UI output to print datatable
    output$slider_values <- DT::renderDataTable(tbl_sliderValues())
  
})
