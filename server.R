
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees )

shinyServer(function(input, output) {
  prediction <- reactive(exp(predict(fit, data.frame(Girth=input$girth, Height=input$height))))
  
  output$predicted_vol <- renderText({
    paste("Predicted volume (cubic ft):", format(prediction(), digits=4, nsmall=2))
    })
  
  output$vg_plot <- renderPlot({
    plot(Volume ~ Girth, data = trees, col='black', xlab="Girth (in)", ylab="Volume (cubic ft)")
    points(input$girth, prediction(), col='red', pch=19, cex=1.5)
    legend("topleft", legend=c("Training Data", "Prediction"), pch=c(1, 19), col=c('black', 'red'))
  })
  
  output$vh_plot <- renderPlot({
    plot(Volume ~ Height, data = trees, col='black', xlab="Height (ft)", ylab="Volume (cubic ft)")
    points(input$height, prediction(), col='red', pch=19, cex=1.5)
    legend("topleft", legend=c("Training Data", "Prediction"), pch=c(1, 19), col=c('black', 'red'))
  })

})
