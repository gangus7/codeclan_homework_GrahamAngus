game_sales <- CodeClanData::game_sales

unique(game_sales$publisher)
unique_publishers <- unique(game_sales$publisher)

library(shiny)
library(tidyverse)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Games Sales"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            radioButtons("publisher",
                        "Which Publisher?",
                        choices = unique_publishers)
        ),
    

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
           

           )
        )
    )


# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        
        game_sales %>%
        filter(publisher == input$publisher) %>%
       ggplot() +
            scale_y_continuous(breaks = 0:40, limits = c(0, 40)) +
            xlab("Critic's Rating") +
            ylab("Sales / £m") +
            geom_point(
                aes(x = critic_score, y = sales, colour  = genre))
                
            
       
        
})
}

# Run the application 
shinyApp(ui = ui, server = server)
