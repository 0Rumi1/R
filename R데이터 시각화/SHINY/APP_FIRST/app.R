# shiny  패키지 설치

if(!require('shiny')){
  install.packages('shiny')
  library(shiny)
}
 

# 내장 예제 실행 
#runExample('02_text')


# 웹앱 프로그램 구조 --------------------------------------------------
# Front-End (UI) + Back-End(server)
# 앱 실행 코드
# ---------------------------------------------------------------------

# Front-End (UI) 처리 함수 구현 -------------------
# 웹 페이지 구성 => 입력 & 출력 요소
# -------------------------------------------------
ui <- fluidPage(
  #print('Hello Shiny~') 
  # 화면에 글자 보여주는 UI 위젯
  # 함수의 첫번째 매개변수는 output 객체의 속성, id
  textOutput('msg'), 
  textOutput('value'),
  #verbatimTextOutput('code'),
  #imageOutput('img1')
)

# Back-End (server) 기능 함수 구현 ----------------
# 사용자의 요청에 해당하는 페이지 생성
# 웹 페이지 출력 내용 생성
# input  : Front-End에서 입력한 데이터 저장 객체 
# output : Front-End로 보낼 데이터 저장 객체 
# -------------------------------------------------
server <- function(input, output, session){
 # 화면에 출력할 내용 => output 객체 매개변수에 지정
  output$msg <- renderText('오늘은 월요일~ 집 가고 싶다')
  output$value <- renderText('123456')
  #output$code <- renderPrint({summary(1:5)})
  #filename <- normalizePath(file.path('C:\\Users\\USER\\Documents\\R\\R데이터 시각화\\SHINY\\APP_FIRST\\image', 'dog.jpg'))
  #            output$img1 = renderImage(
  #                      {
  #                        list(src = filename,
  #                           contentType='image/jpg',
  #                           alt='This is alternate text')
  #                      }, deleteFile = FALSE
  #                        )

  #  output$code<-renderPrint(summary(1:5))
    filename<-normalizePath(file.path("C:\\Users\\USER\\Documents\\R\\R데이터 시각화\\SHINY\\APP_FIRST\\image\\dog.jpg"))
      output$img1<-renderImage(
        {
          list(src=filename,
               contentType='image/png',
               alt="This is alternate text")
        },deleteFile=FALSE
                )
              
                 
}


# Shiny Web App 실행 ------------------------------
# 실행 앱의 Front-End, Back-End 지정
# -------------------------------------------------
shinyApp(ui=ui, server=server)


# 출력 위젯 - 텍스트
# UI 처리 기능 함수
#ui <- fluidPage(
#  textOutput('msgTXT')
#)

# 요청 처리 서버 기능 함수
server 




























