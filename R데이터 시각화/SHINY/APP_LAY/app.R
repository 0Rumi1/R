library(shiny)

ui <- fluidPage(
  # 제목
  titlePanel("다이아몬드 투명도에 따른 분석"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("level",
                  "Diamond Level",
                  min = 0,
                  max = 10,
                  value = 3),
      #checkboxInput("chk", "VALUE"),
      #actionButton("OK", 'ok')
    ),
    mainPanel(
      textOutput("selectValue")
      #plotOutput("distPlot"),
      #textOutput("checkvalue")
      
    )
  )
)


server <- function(input, output) {
  #output$distplot <- renderPlot({
  #  hist(rnorm(input$obs))
  #})
  output$selectValue <- renderText(input$level)
  #output$checkvalue <- renderText({})
}

#Shiny Web App 실행----------------------------------------------
#-실행 앱의 Front-End, Back-End 지정
shinyApp(ui=ui,server=server)
