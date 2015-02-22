# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
    
    #Convert input coordinate to output coordinate depending upon coordType
    coordConvert <- function(iCoord, coordType){
        #Convert DDDMMSS to DD
        if (coordType == "1") {
            degs <- as.numeric(substr(iCoord,1,3))
            mins <- as.numeric(substr(iCoord,4,5))
            secs <- as.numeric(substr(iCoord,6,7))
            return (as.character(degs + mins / 60 + secs / 3600))
        }
        #Convert DD to DDDMMSS
        else {
            iCoord <- as.numeric(iCoord)
            degs <- as.character(trunc(iCoord))
            mins <- as.character((trunc(iCoord * 60)) %% 60)
            secs <- as.character(round((iCoord * 3600) %% 60,0))
            #Fix the outputs to fit the DDDMMSS format
            if (nchar(degs) == 2) {
                degs <- paste("0",degs,sep="")
            }
            else if (nchar(degs) == 1) {
                degs <- paste("00",degs,sep="")
            }
            if (nchar(mins) == 1) {
                mins <- paste("0",mins,sep="")
            }
            if (nchar(secs) == 1) {
                secs <- paste("0",secs,sep="")
            }
            return (paste(degs,mins,secs,sep=""))
        }
    }
  
    output$text1 <- renderText({        
        coordConvert(input$inCoord, input$radio)})
})
