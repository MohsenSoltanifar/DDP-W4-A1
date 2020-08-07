library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict American Annual January Unemployment from Year"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("slideryear", "What is the unemployment rate?", 2010, 2020, value = 2015),
      checkboxInput("showModel", "Show/Hide Model ", value = TRUE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Unempoyment Rate from Model:"),
      textOutput("pred1")
    )
  )
))

