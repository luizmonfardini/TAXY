library(shiny) 

TAX<-function(salary,income) {100*(1-(salary)/(income))}

diagnostic_f<-function(salary,income){
  TAX_value<-100*(1-(salary)/(income))
  ifelse(TAX_value<3,"Low Tax",ifelse(TAX_value<7,"Normal Tax",ifelse(TAX_value<15,"High Tax","Very High Tax")))
}

shinyServer(
  function(input, output) {
    
    output$inputsalaryvalue <- renderPrint({input$salary})
    output$inputincomevalue <- renderPrint({input$income})
    output$estimation <- renderPrint({TAX(input$salary,input$income)})
    output$diagnostic <- renderPrint({diagnostic_f(input$salary,input$income)})
  } 
)