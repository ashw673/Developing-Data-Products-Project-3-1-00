# This is the user-interface definition of a Shiny web application. You can

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    # Application title
    titlePanel("Predict Miles per Gallon"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("wt_input","What is the weight(wt) of the car",min=1,max=6,value=2),
            sliderInput("qsec_input","what is the 1/4 mile time of the car",min=5,max=40,value=1),
            selectInput("am_input",
                "whether transmission is automatic(0) or manual(1)",
                c(0,1))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted MPG"),
            textOutput("mpg_pred")
        )
    )
))
