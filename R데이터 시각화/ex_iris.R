# 내장 데이터셋 iris
# 데이터 분석
# 독립변수, 종속변수
# 선형분석 후 선형식 도출
# ---------------------------------------------------------

# 데이터 준비 및 확인
source('C:\\Users\\USER\\Documents\\R\\utils\\util.R')
library(MASS)
displayInfo(iris)


# 데이터 전처리
checNa(iris)
checkMode(iris)

# 데이터 분포 형태 체크
iris.cor <-cor(iris[-5]) # 5번째 행은 제외
iris.cor # peta.width, petal.length 가 0.96 으로 1다음으로 가장 큰 값이다.

dataDF <-data.frame(length=iris$Petal.Length, width=iris$Petal.Width)
dataDF

# 독립변수 & 종속변수 선택
corr.test(iris[,-5])

# t.test(iris$Sepal.Length)
iris.cor['Petal.Width', 'Petal.Length']

plot(iris$Petal.Length,iris$Petal.Width, main='Petal.Width - Petal.Length', col='blue', pch=20, cex=2)
abline(Prestige.lm, col='salmon', lwd=2)

shapiro.test(iris$Petal.Width)
shapiro.test(iris$Petal.Length)

qqplot(iris$Petal.Width, iris$Petal.Length)


# 선형회귀식 도출 및 결과 출력 

model <-lm(dataDF$width~dataDF$length, data=dataDF)
model

# 선형회귀식 상세보기
summary(model) # 해당 식이 유의한가 확인하는 식, 제일 마지막 F검정
# eroor 낮을 수록 좋다. R squared 높을 수록 좋다.

# 회귀계수만 추출 => coef(선형객체)
mCoef <- coef(model)[1]; 
coef(model)[2]; 

mCoef[1]

# 회귀식 y= 기울기*x+x절편
pre_y<-coef(model)[2]*dataDF$length+mCoef[1] # 예측값
pre_y


# 잔차 => (관측치 - 예측치)^2
r_err<-sum((dataDF$width-pre_y)^2)
r_err








