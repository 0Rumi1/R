# -----------------------------------------------------------------
#  단순 선형회귀 분석
#  - 조건 :  선형성이 존재
#            독립변수-종속변수  => 인과관계, 상관관계
#            정규분포 형태로 데이터 분포
#  - 결과 : 선형회귀식 => 회귀계수
#  - 평가 : RSE 작을 수록, R^2 높을 수록 
#  - 검정 : 잔차에 대한 검정
# -----------------------------------------------------------------
# 데이터 준비 ------------------------------------------------------
file="data\\iris.csv"
irisDF<-read.csv(file)

# 데이터 기본 정보 확인 ---------------------------------------------
# (1) 기본 정보 즉 평균, 중앙값, 최소값, 최대값, 사분위값, 표준편차 등등
str(irisDF)
summary(irisDF)
class(iris)

# (2) 그래프로 확인
# 컬럼과 컬럼 사이의 관계 및 데이터 분포 확인
plot(irisDF)

# 컬럼별 정규성 확인 >> qqnorm()/qqline()/hist()/lines()
par(mfrow=c(2, 4))

for(col in colnames(irisDF)[-5])
{
    qqnorm(irisDF[,col], main=paste(col, "Q-Q"))
    qqline(irisDF[,col], col='red', lwd=2)
}

for(col in colnames(irisDF)[-5])
{
    hist(irisDF[,col], freq=FALSE, main=paste(col, "HIST"))
    lines(density(irisDF[,col]), col='red', lwd=2)
}

# (3) 통계함수 수치 값 확인
# 컬럼과 컬럼 사이의 관게  => cor.test(변수1, 변수2)
# => petal_length, petal_width 선택
cor.test(irisDF$sepal_length, irisDF$petal_length)
cor.test(irisDF$sepal_length, irisDF$sepal_width)
cor.test(irisDF$sepal_length, irisDF$petal_width)
cor.test(irisDF$sepal_length, irisDF$petal_length)
cor.test(irisDF$petal_length, irisDF$petal_width)

# 컬럼별 정규성 확인 >> shapiro.test()
for(col in colnames(irisDF[-5]))
     print(paste(col, round(shapiro.test(irisDF[,col])$p.value, 4)))

# 데이터 전처리 ------------------------------------------------
# (1) 결측치 체크 & 최빈값 

# (2) 중복 데이터 체크 => unique()

# (3) 이상치 체크 & 처리

# (4) 데이터의 값의 범위 => 데이터 변환 scale()

# -------------------------------------------------------------
# petal_length, petal_width의 선형회귀분석 구현
# - 독립변수 : petal_length
# - 종속변수 : petal_width
# - 분석방식 : 단순선형회귀 
# - lm(종속~독립, data=데이터)
# -------------------------------------------------------------
# (1) 단순선형회귀 생성
irisMD<-lm(irisDF$petal_width~irisDF$petal_length, data=irisDF)

# (2) 단순선형회귀 관련 값들 확인
# (2-1) 회귀계수 coef()
iris_slope<-round(coef(irisMD)[2], 4)
iris_inter<-round(coef(irisMD)[1],4)
iris_slope; iris_inter;

# (2-2) 잔차 resid()
mean(resid(irisMD)^2)

# (3) 단순선형회귀 보고서(설명서)
summary(irisMD)

# -------------------------------------------------------------
# 잔차 검정
# - 선 행 성 : car 패키지 > boxTidwell()
# - 정 규 성 : shapiro.test()
# - 등분산성 : car 패키지 >ncvTest()
# - 독 립 성 : lmtest 패키지 > dwtest()
# -------------------------------------------------------------
# (1) 모델에대한 검정 그래프 출력
plot(irisMD)

# (2) 함수기반 수치값 검정
# (2-1) 정규성
shapiro.test(resid(irisMD))
hist(resid(irisMD))

# (2-2) 등분산성
library(car)
ncvTest(irisMD)

# (2-3) 독립성
library(lmtest)
dwtest(irisMD)

# (2-4) 선형성 
boxTidwell( irisDF$petal_width~irisDF$petal_length, data=irisDF)

predict(irisMD, newdata=data.frame(petal_length=c(4.2)), interval="prediction")
predict(irisMD, newdata=data.frame(speed=c(3)), interval="prediction")
