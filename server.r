library(shiny)
library(shinyjs)
my_vars <-c("mpg"=1,"cyl"=2,"disp"=3,"hp"=4,"drat"=5,"wt"=6,"qsec"=7,"vs"=8,"am"=9,"gear"=10,"carb"=11)

shinyServer(function(input,output,session){
  output$myhist<-renderPlot({
    colm<-as.numeric(input$var)
    hist(mtcars[,colm],breaks=seq(0,max(mtcars[,colm]),l=input$bins+1),main="histogram of mtcar dataset",xlab=names(mtcars[colm]))
    
    observe({
      if(!is.null(input$var1))
        updateSelectInput(session, "var", 
                          choices = my_vars[!(my_vars %in% input$var1)], 
                          selected = isolate(input$var) )
    })
    
    
  })
  
  
  
  
  output$myhist2<-renderPlot({
    colm<-as.numeric(input$var1)
    hist(mtcars[,colm],breaks=seq(0,max(mtcars[,colm]),l=input$bins1+1),main="histogram of mtcar dataset",xlab=names(mtcars[colm]))
    
    
  })
  observe({
    if(!is.null(input$var))
      updateSelectInput(session, "var1", 
                        choices = my_vars[!(my_vars %in% input$var)], 
                        selected = isolate(input$var1) )
  })
  
  
})

