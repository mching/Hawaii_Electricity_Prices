library(shiny)
library(dplyr)

dat <<- read.csv(file = "./data/prices.csv")
dat <- dat[dat$Sector !=  "All Sectors", ]
dat$RptMonth <- as.Date(strptime(dat$RptMonth, format = "%m/%d/%Y"))

shinyServer(function(input, output) {
        
    output$summary <- renderPrint({
        Island_input <- input$island_input
        Sector_input <- input$sector_input
        start_date <- input$date_input[1]
        end_date <- input$date_input[2]
        filter(dat, as.numeric(Island) == Island_input & 
                   as.numeric(Sector) == Sector_input) %>%
            filter(RptMonth >= start_date & RptMonth <= end_date) %>%
            select(Price) %>%
            summarise_each(funs(median))
    })
    
})
