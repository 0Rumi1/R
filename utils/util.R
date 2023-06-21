# ------------------------------------------------------
# 공통으로 자주 사용되는 함수들 
# ------------------------------------------------------

# 객체의 기본 정보 출력 기능 함수 ----------------------
displayInfo <- function(data){
  str(data)
  summary(data)
}


# 결측치 체크 기능 함수
checkNa <-function(data){
  eNum<-sum(is.na(data))
  rNum<-sum(!complete.cases(data))
  print(paste('원소 Na', eNum, '행 Na', rNum, sep=" - "))
}


#library(stringr) #11장


# 최빈값 체크 기능 함수 --------------------------------
checkMode <-function(data){
  for (col in colnames(data))
  {
    # 컬럼별 빈도표 >> 최댓값
    max(table(data[col]))                    # 컬럼별로 가장 많은 갯수
    maxIdx <- which.max(table(data[col]))  # 인덱스 
    maxValue <- names(which.max(table(data[col])))  # 가장 많이 나온 값
    print(paste(col, '최빈값 : ', maxValue))
  }
}


# 이상치 체크 기능 함수 --------------------------------
# 과제 => 여러개



# 전체 데이터의 상관계수 체크 기능 함수 ----------------
# 매개변수 => 데이터객체, 기준컬럼명

checkCor <-function(data, col){
  
}





