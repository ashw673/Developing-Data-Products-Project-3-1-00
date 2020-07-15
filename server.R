
# This is the server logic of a Shiny web application. You can run the


library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    ## result from analysis in presentation
    mod<-lm(mpg~wt+qsec+am,data=mtcars)
        
    mpg_pred1<-reactive({
        wtInput<-input$wt_input
        qsecInput<-input$qsec_input
        amInput<-as.numeric(input$am_input)
        predict(mod,newdata=data.frame(wt=wtInput,qsec=qsecInput,am=as.numeric(input$am_input)))
    })
    
    output$plot1 <- renderPlot({
          wtInput<-input$wt_input
          qsecInput<-input$qsec_input
          amInput<-as.numeric(input$am_input)
        
          plot(mtcars$wt,mtcars$mpg,xlab="Weight(1000 lbs)",
               ylab="Miles per gallon",xlim=c(1,6),ylim=c(5,40),
               pch=21)
          points(wtInput,mpg_pred1(),col="red",pch=19)
    })
    
    
    output$mpg_pred<-renderText({
          mpg_pred1()
    })
})
