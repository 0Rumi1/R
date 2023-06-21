library(shiny)

# UI 요소 구성 부분
ui <- fluidPage(
  # 웹페이지에 타이틀 UI 요소 추가
  titlePanel("데이터 분석"),
  
  # 웹페이지에 내용 UI 요소 추가
  # 화면을 좌-우로 나워서 사용 => sidebarLayout()
  sidebarLayout(
    # 왼쪽 부분, 입력 UI
      sidebarPanel(radioButtons("type", "Blood TYPE :", c("A", "B", "AB", "O")),
      sliderInput("age", "AGE", min=0, max = 200, value = 20)
    ),
    # 오른쪽 부분
    mainPanel(
      # 출력 UI
      # Blood Type 을 텍스트로 출력
      textOutput("blood"), 
      # Age에 대한 그래프 출력
      plotOutput("pAge"))

  )
)

# SERVER 구현 부분
server <- function(input, output, session){
  # input 매개변수 <= UI 로부터 입력받은 데이터 저장
  # input$type, input$age

  # 출력 UI 에 데이터 랜더링하기
  # output$blood, output$pAge
  output$blood <- renderText(paste("당신의 혈액형은 ", input$type, "형 입니다."))
  output$pAge <- renderPlot(plot(0:input$age, col = 'red', pch=20))
}


ui2 <- fluidPage(
  titlePanel("다이아몬드 데이터 분석"),
  
  tabsetPanel(
    tabPanel("캐럿에 대한 분석 결과"),
    tabPanel("투명도에 대한 분석 결과"),
    tabPanel("컷팅에 대한 분석 결과")
)
)


# Shiny App 실행 부분
shinyApp(ui2
         , server)
