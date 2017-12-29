#This UI R file is used to show earler years share price trend of Google in NASDAQ stock exchange based on selected duration using radio button

library(shiny)

shinyUI(fluidPage(
  titlePanel("View share price trend of google in NASDAQ for earler years based on selected time duration"),
  sidebarLayout(
    
    sidebarPanel(   #contain input
      
                  radioButtons("mySelect", "select particular year range", choices = c("Jan2008-Dec2013", "Jan2008-Dec2011"))
    ),  #end sidebar panel
    
    mainPanel(  #contain output
      
      plotOutput("plot1") #show the plot in main panel that was generated at server side
    ) #end main panel
  
  ) # end sidebarLayout
))
                                                                            