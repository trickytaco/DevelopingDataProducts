
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Geographic Coordinate Converter"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Input Coordinate for Conversion"),
      textInput("inCoord", NULL, ""),
      radioButtons("radio", "Conversion Type:",
                   choices = list("DMS to DD" = "1", "DD to DMS" = "2")),
      submitButton("Convert"),
      h5("USAGE: Enter a geographic coordinate, in either
         Degrees-Minutes-Seconds (DDDMMSS format, 0124517 for example) or
         Decimal Degrees format (DD.DDDDD format, 113.45987 for example).
         Choose the type of conversion you want to perform with the radio
         buttons and click the Convert button.  If you enter an invalid
         format, NA will be returned in the results.  For DDDMMSS format,
         the leading 0(s) is required if the number of degrees is less
         than 100."),
      h5("NOTE: Currently, this app does not allow the user to enter a
         hemisphere and assumes Northern or Eastern hemisphere
         for DDDMMSS coordinates.  Similarly, this app does not allow
         negative DD coordinates.")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h3("Output Coordinate"),
      textOutput("text1")
    )
  )
))
