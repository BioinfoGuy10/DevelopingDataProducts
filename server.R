#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output, session)
{
  suppressMessages(library(randomForest))
  suppressMessages(library(dplyr))
  suppressMessages(library(taRifx))


  print("Reading in the Salary Data")
  #Reading the salary data for employees in the San Francisco Area
  salary_data <- read.delim("C:/Users/ksaldanh/Desktop/R/Developing_Data_Products/Employee_Compensation_1.csv",encoding = 'UTF-8', header = T, sep="\t")
  print("Successfully Read the Salary Data")

  #Create a Dataset with the specially chosen predictors for model creation

  print("Creating a Dataset with the specially chosen predictors for model creation")
  model_data <- salary_data[, c("Organization_Group", "Job_Family", "Total")]
  model_data <- remove.factors(model_data)
  #Create a Random Forest Model
  print("Building a Random Forest Model")
  salary_model <- lm(Total ~ Organization_Group + Job_Family, data = model_data)
  print("Model successfully built")

  #output$value <- renderPrint(input$select)
  #output$value1 <- renderPrint(input$select1)

  salary_pred <- reactive({
    org_grp <- input$select1
    job_fam <- input$select
    predict(salary_model, newdata = data.frame(Organization_Group= org_grp, Job_Family= job_fam))
  })

  output$value2 <- renderText({

    salary_pred()
    })

}
