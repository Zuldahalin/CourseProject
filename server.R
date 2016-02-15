#Shiny Server Application that plots the Air Pollutant Index for Kuala Lumpur
#The dataset was downloaded from http://data.gov.my/view.php?view=280 
library(shiny)
library(lubridate)
library(ggplot2)
server <- function(input, output){ 
  kl <- read.csv("API_KL.csv")
  kl$Date <- as.POSIXct(kl$Date, format = "%d/%m/%Y")
  
  output$plot1 <- renderPlot({ #if only 1 input place outside output
    selected.data <- kl[month(kl$Date)==input$month & year(kl$Date)==input$year,]#user input from ui

    ggplot(selected.data, aes(x=selected.data$Date, y=selected.data$API))+geom_smooth(color="red")+labs(x="Week of the Month\n", y="API Reading")
    
  })
}


##shinyApp(ui=ui, server = server)