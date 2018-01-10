library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Shiny App Percentage TAX Calculator"),
    
    sidebarPanel(
      numericInput('income', 'Enter your monthly income with taxes in USD', 1600, min = 500, max = 10000, step = 100),
      numericInput('salary', 'Enter your montly salary without taxes in USD', 1000) ,
      submitButton('Calculate TAX')
    ), 
    mainPanel(
      p('The tax percentage (TAX) is a measure of how much you pay montly in taxes'),
      tags$div(
        tags$ul(
          tags$li('TAX < 3%       : Low Taxes'),
          tags$li('TAX [3.1% - 7%] : Normal Taxes'),
          tags$li('TAX [8% - 15%]   : High Taxes'),
          tags$li('TAX >= 15%        : Very High Taxes')
        )
      ),
      
      h4('Calculating TAX based on values entered by you:'), 
      p('income with taxes in USD:'), verbatimTextOutput("inputincomevalue"),
      p('salary without taxes in USD:'), verbatimTextOutput("inputsalaryvalue"),
      h4('Your TAX percentage is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
      
    )
    
  )   
)