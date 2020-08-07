
library(shiny)
shinyServer(function(input, output) {

year<-c(2010, 2011,  2012, 2013, 2014,  2015 ,2016 ,2017, 2018, 2019,2020)
UR<-c(9.8,9.1,8.3,8.0,6.6,5.7,4.9,4.7, 4.1,4.0,3.6)
mydata<-data.frame(year, UR)  
  
  
model1 <- lm(UR ~  poly(year,1,raw = TRUE) , data = mydata)
 
  
model1pred <- reactive({
yearInput <- input$slideryear
predict(model1, newdata = data.frame(year = yearInput))
})
  
 
output$plot1 <- renderPlot({
yearInput <- input$slideryear
    
plot(mydata$year, mydata$UR, xlab = "Year", 
ylab = "Unemployment Rate(%)", bty = "n", pch = 16,
xlim = c(2010, 2020), ylim = c(3, 10))
    
if(input$showModel){abline(model1, col = "red", lwd = 2)}
points(yearInput, model1pred(), col = "red", pch = 16, cex = 2)
})
output$pred1 <- renderText({ model1pred()})
})

