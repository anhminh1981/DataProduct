
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predictor of timber volume for black cherry trees"),

  
  sidebarLayout(
    sidebarPanel(
      helpText("Calculate the volume of timber yielded by a black cherry tree"),
      numericInput('girth', 'Girth (in) of the tree', value=12, min=8, max=21, step=0.5),
      numericInput('height', 'Height (ft) of the tree', value=76, min=63, max=87, step=1)
    ),

    
    mainPanel(
      h3("Result"),
      textOutput("predicted_vol"),
      h3("Volume vs Girth"),
      plotOutput("vg_plot"),
      h3("Volume vs Height"),
      plotOutput("vh_plot")
    )
  )
))
