#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

ui <- fluidPage(
    
    titlePanel("Final Project Shiny App"),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("preImage")
    )
)

server <- function(input, output) {
    # Send a pre-rendered image, and don't delete the image after sending it
    output$preImage <- renderImage({
        # When input$n is 3, filename is ./images/image3.jpeg
        filename <- normalizePath(file.path("dist_plot.png"))
        
        # Return a list containing the filename and alt text
        list(src = filename,
             height = 600,
             alt = 'plot')
    }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)
