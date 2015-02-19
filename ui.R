
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
set_start_date <- "2008-01-31"
set_end_date <- "2012-03-31"

shinyUI(fluidPage(

  # Application title
  titlePanel("Hawaii Electricity Rates"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateRangeInput("date_input", "Dates to find prices", start = set_start_date,
                     end = set_end_date, min = set_start_date, 
                     max = set_end_date),
      radioButtons("sector_input", label = h3("Sector"),
                   choices = list("Commercial" = 2, "Residential" = 3, "Street Lights" = 4), 
                   selected = 2),
      radioButtons("island_input", label = h3("Island"),
                   choices = list("Hawaii" = 1, 
                                  "Kauai" = 2,
                                  "Lanai" = 3,
                                  "Maui" = 4,
                                  "Molokai" = 5,
                                  "Oahu" = 6
                                  ), 
                   selected = 1)
    ),

    mainPanel(
      h3("Median Electricity Price"),
      h4("The median electricity price (cents/kwh) for the dates and island selected is: "),
      verbatimTextOutput("summary")
    )
  )
))
