library(shiny)
my_vars <-c("mpg"=1,"cyl"=2,"disp"=3,"hp"=4,"drat"=5,"wt"=6,"qsec"=7,"vs"=8,"am"=9,"gear"=10,"carb"=11)
shinyUI(fluidPage(
  titlePanel(title=h1("Histogram plot of mtcars dataset",align="center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var","Select the variable from mtcar dataset to plot a histogram",choices =my_vars ,selected=my_vars["mpg"]),
      br(),
      br(),
      sliderInput("bins","Select the number of bins",min=0,max=15,value=10),
      br(),
      br(),
      selectInput("var1","Select the variable from mtcar dataset to plot a histogram",choices=my_vars,selected=my_vars["vs"]),
      br(),
      br(),
      
      sliderInput("bins1","select the number of bins",min=0,max=15,value=10)),
    
    mainPanel(
      plotOutput("myhist"),
      plotOutput("myhist2"),
    )  
  )
)
)