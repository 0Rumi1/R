# 선형회귀 분석
# - 조건: 선형성이 존재
#         독립변수 - 종속변수 --> 인과관계가 있는지 확인해야함, 상관관계 확인하기
#         정규분포 형태로 데이터 분포 
# - 결과: 선형회귀식 => 회귀계수
# - 평가: RSE 작을수록, R^2 높을수록 
# - 검정: 잔차에 대한 검정

iris


#install.packages('outliner')

# 데이터 기본 정보 확인
# (1) 기본 정보 즉 평균, 중앙값, 최소값, 최대값, 사분위값, 표준편차 등
# 수치값으로 확인
str(iris)
summary(iris) # 통계 수치를 한번에 확인


# (2) 그래프로 확인
# 컬럼과 컬럼 사이의 관계
plot(iris)

# 컬럼별 정규성 확인 > qqnorm(), qqline()/hist()/lines()

par(mfrow=c(2,4))

for(col in colnames(iris)[-5])
{
  qqnorm(iris[,col], main=paste(col, 'Q-Q'))
  qqline(iris[,col], col='red', lwd=2)
  #qqnorm(iris$Sepal.Length)
  #qqline(iris$Sepal.Length, col='red', lwd=2)
}

for(col in colnames(iris)[-5])
{
  hist(iris$Sepal.Length, freq=FALSE, main=paste(col, 'HIST'))
  lines(density(iris$Sepal.Length), col='red', lwd=2)
}


class(iris$Sepal.Length)     # numeric
class(iris['Sepal.Length'])  # 데이터 프레임
class(iris[,'Sepal.Length']) # numeric



# (3) 통계함수 수치 값 확인
# 컬럼과 컬럼 사이의 관계 => cor.test(변수1, 변수2)
cor.test(iris$Sepal.Length, iris$Petal.Length) 
cor.test(iris$Sepal.Length, iris$Sepal.Width)
cor.test(iris$Sepal.Length, iris$Petal.Width) 
cor.test(iris$Petal.Length, iris$Petal.Width) # cor 가장 높음


# 컬럼별 정규성 확인 > shapiro.test()
for(col in colnames(iris[-5])){
  print(paste(col, round(shapiro.test(iris[,col])$p.value),3))
}


# 데이터 전처리 --------------------------------------------------------------------
# (1) 결측치 체크 & 최빈값

# (2) 중복 데이터 체크 => unique()

# (3) 이상치 체크 & 처리

# (4) 데이터의 값의 범위 => 데이터 변환 scale()

# ----------------------------------------------------------------------------------
# petal_length, petal_width의 선형회귀 분석 구현 
# 독립변수: petal_length
# 종속변수: petal_width
# 분석방식: 단순선형회귀
# lm(종속~독립, data=데이터)
# ----------------------------------------------------------------------------------

class(iris)

# (1) 단순 선형회귀 생성
irisMD<-lm(iris$Petal.Width~ iris$Petal.Length, data=iris)
irisMD
attributes(irisMD)

# irirDF >>> iris 변경하기

#(2) 단순선형회귀 관련 값들 확인
# (2-1) 회귀계수 coef()
iris_slope <- round(coef(irisMD)[2],4)
iris_inter <- round(coef(irisMD)[1],4)

iris_slope; iris_inter;

# (2-2) 잔차 resid()
mean(resid(irisMD)^2)

# (3) 단순선형회귀 보고서(설명서)
summary(irisMD)



# 잔차검정
# 선행성
# 정 규 성 : petal_length (3-5000 개까지만 검정 가능): shapiro.test()
# 등분산성 : ncvTest() <- car 패키지
# 독 립 성 : lmtest 패키지 > dwtest()
# (1) 모델에 대한 검정 그래프 출력

plot(irisMD)

# (2) 함수기반 수치값 검정
# (2-1) 정규성
shapiro.test((resid(irisMD)))

# (2-2) 등분산성
#install.packages('car')
#install.packages('lmtest')
library(car)
library(lmtest)
ncvTest(irisMD)


# 독립성
library(lmtest)
dwtest(irisMD)



# ----------------------------------------------------------------------------------
# petal_length, petal_width의 선형회귀 분석 구현 
# 독립변수: sepal_width, sepal_length, petal_width
# 종속변수: petal_length
# 분석방식: 다중선형회귀
# lm(종속~독립, data=데이터)
# ----------------------------------------------------------------------------------

#(1) 

































