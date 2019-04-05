#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

print("Loading Libraries")
suppressMessages(library(shiny))

if (interactive())
{

  library(shiny)
  library(shinyWidgets)

  ui <- fluidPage(
    tags$h1("Salary Predictor"),
    br(),

    # Copy the line below to make a select box
    selectInput("select", label = h3("Select your Job Category"),
                choices = salary_data$Job_Family,
                selected = 1),


    fluidRow(column(5, verbatimTextOutput("value"))),
    hr(),

    selectInput("select1", label = h3("Select your Organization Group"),
                choices = salary_data$Organization_Group,
                selected = 1),

    hr(),
    fluidRow(column(3, verbatimTextOutput("value1"))),
    mainPanel(
    h4("Your Predicted Salary is: (in Dollars)"),
    fluidRow(column(3, textOutput("value2")))
    )
)
}
