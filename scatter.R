# -------------------------------------------
# 내장 데이터 cars 활용
# cars 데이터 정보 출력
# 50대 자동차의 속도와 제동거리 관계 그래프화
# -------------------------------------------
# 데이터 로딩 -------------------------------
cars

# 데이터 확인 -------------------------------
# (1) 데이터 요약 정보 & 구조 출력
str(cars)

# (2) 행과 열 출력
dim(cars)

# (3-1) 행 갯수만 출력
nrow(cars)

# (3-2) 열 갯수만 출력
ncol(cars)

# (4) 컬럼명 출력
colnames(cars)

# 데이터 표현 By 산점도 그래프 --------------
# 두 개 변수 비교 => 데이터 2개
plot(cars$speed, cars$dist, 
     main="속도 vs 거리", 
     xlab = '속도', ylab='거리')


# 날짜 시간에 따라 바뀌는 데이터, 시게열 데이터라 한다. 
# -------------------------------------------
# 내장 데이터 Nile 활용
# Nile 데이터 정보 출력
# 년도별 유속 정보 표현
# -------------------------------------------
str(Nile)
Nile
dim(Nile)
colnames(Nile)
df = data.frame(Nile)

plot(1871 : 1970, Nile, xlab = '년도', ylab = '유속', type = 'l', col = 'orange', lwd = '3')



# 막대그래프 > table() 함수 : 각 값의 빈도를 계산하여 표의 형태로 반환
# -------------------------------------------------
# 이산적 데이터 자료를 표현
# -> 각 데이터(값)에 빈도를 표현 >> tabel()
# -> 막대 그래프 표현
# -------------------------------------------------
# 외부 데이터 로딩 --------------------------------

popData<-read.csv('C:/Users/USER/Documents/R/2010_1%_인구사항_20230214_48383.csv', header = F)

popData
str(popData)



# 코드(숫자자료형) 범주형 데이터를 문자형으로 변환
# factor(데이터, levels, labels)
popData$V1 <- factor(popData$V1, levels=1:2, labels = c('남자', '여자'))
str(popData)


# 데이터 백업 => save(데이터, 파일경로)
savePath = ('C:/Users/USER/Documents/R/2010_1%_인구사항_20230214_48383.RData')
save(popData, file = savePath)




popData$V3 <- factor(
  popData$V3, 
  levels = 1:14,
  labels=c('가구주', '가구주의 배우자',
           '자녀', '자녀의 배우자', '가구주의 부모',
           '배우자의 부모', '손자녀, 그 배우자',
           '증손자녀, 그 배우자', '조부모',
           '형제자매, 그 배우자', '형제자매의 자녀, 그 배우자',
           '부모의 형제자매, 그 배우자', '기타 친인척', '그외같이사는사람')
)

popData$V4 <- factor(
  popData$V4,
  levels = 1:8,
  labels = c("안 받았음", "초등학교", "중학교", "고등학교",
             "대학-4년제 미만", "대학-4년제 이상", "석사과정", "박사과정")
)


str(popData)
save(popData, file = savePath)
save.image("data.rda")























