library(shiny)
library(quantmod) #importing financial R package library

#The server side code capture input from UI and generate google share price trend graph
shinyServer(function(input, output) {

                       model1pred <- reactive({ 
                           selectedInput <- input$mySelect #capture input from UI dynamically
                         })

                       output$plot1 <- renderPlot({ #generate the plot (google share price trend) based on given user input
                  
                            selectedInput <- model1pred() #get the selected time duration from the reactive function
                            #print(selectedInput)
                            if(selectedInput == "Jan2008-Dec2013"){
                              #format date
                              from.dat<- as.Date("01/01/08", format="%m/%d/%y")
                              to.dat<- as.Date("12/31/13",   format="%m/%d/%y")
                              #get data from google finance dataset in NASDAQ using google symbol
                              getSymbols("GOOG", src="google", from=from.dat, to=to.dat)
                              
                              head(GOOG)
                              GOOG <- GOOG[,-which(apply(is.na(GOOG), 2, all))]
                              #summarize monthly and store as time series variable
                              mGoog <- to.monthly(GOOG) #convert to monthly
                              googOpen <- Op(mGoog) #taking opening information
                              ts1 <- ts(googOpen, frequency = 12) #creating time series object using ts() function of R
                              plot(ts1,xlab="Years+1",ylab="GOOG") #plotting monthly opening price info
                              
                            } #end if
                          
                          if (selectedInput == "Jan2008-Dec2011"){
                            #format date
                            from.dat<- as.Date("01/01/08", format="%m/%d/%y")
                            to.dat<- as.Date("12/31/11",   format="%m/%d/%y")
                            #get data from google finance dataset in NASDAQ using google symbol
                            getSymbols("GOOG", src="google", from=from.dat, to=to.dat)
                            
                            head(GOOG)
                            GOOG <- GOOG[,-which(apply(is.na(GOOG), 2, all))]
                            #summarize monthly and store as time series variable
                            mGoog2 <- to.monthly(GOOG) #convert to monthly
                            googOpen2 <- Op(mGoog2) #taking opening information
                            ts2 <- ts(googOpen2, frequency = 12) #creating time series object using ts() function of R
                            plot(ts2,xlab="Years+1",ylab="GOOG2") #plotting monthly opening price info
                            } #end if
                          
 
                          else{}#do nothing
                          
                          }) # end renderplot
                        
})   #end shinyServer   
                    
                          
                          
                          
                          
                          
                          
                          
                          