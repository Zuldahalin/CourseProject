#User Interface for plotting Air Pollutant Index for Kuala Lumpur
#The dataset was obtained from the API from 2013 to 2015.
library(shiny)
library(lubridate)
library(ggplot2)

ui <- fluidPage(
  headerPanel("Kuala Lumpur Air Pollutant Index 2013-2015"),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", label="Select Year", selected = 2015, choices = c(2013,2014,2015)),
      selectInput("month", label = "Select Month", selected = 1, choices = c(1,2,3,4,5,6,7,8,9,10,11,12)),
      h4('API Scale - Air Quality'),
      p('Below 50','===>','Good'),
      p('51 - 100','===>','Moderate'),
      p('101 - 200','===>','Unhealthy'),
      p('201 - 300','===>','Very Unhealthy'),
      p('Above 300','===>','Hazardous')      
    ),
    mainPanel(
      h3("Air Pollutant for Kuala Lumpur"),
      plotOutput("plot1")

    )
    
  )
  
  
)
