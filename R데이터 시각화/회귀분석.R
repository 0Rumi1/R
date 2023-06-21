# 회귀(Regression)
# 선형 데이터의 관계를 나타내는 모형 => 선형회귀모델 또는 선형회귀식
# 전제 : 선형관계에 데이터
# 예측 => 미래 데이터에 대한 예측 가능해짐


# 데이터 준비
install.packages('HistData')
library(HistData)

source('C:\\Users\\USER\\Documents\\R\\utils\\util.R')

# 콜덴패밀리 데이터셋 정보 확인
displayInfo(GaltonFamilies)
str(GaltonFamilies)


# 부모키와 자식키의 데이터 관련성-------------------------------------
df <- GaltonFamilies

# By 그래프
plot(df$midparentHeight, df$childHeight)

# By 수치
shapiro.test(df$midparentHeight) # 값이 매우 작음. 즉, 정규성을 띄지 않음
shapiro.test(df$childHeight)     # 값이 매우 작음. 즉, 정규성을 띄지 않음
cor(df$midparentHeight, df$childHeight)
cor(df$midparentHeight, df$childHeight, method = 'kendall')


model <- lm(childHeight ~ midparentHeight, data = df)
model


# 부모의 키가 자식의 키에 영향이 있다. ==> 직선
# lm()
lm(df$childHeight ~df$midparentHeight, data=df)

library(car)


# 오래 교육을 받을 수록 소득에 영향이 있다.
str(Prestige)
Prestige.lm <- lm(income ~ education, data = Prestige)
Prestige.lm
class(Prestige.lm)

plot(Prestige$income~Prestige$education,
     col='cornflowerblue', pch=19,
     xlab='Education(year)', ylab='Income(dollars)',
     main = 'Education and Income')
abline(Prestige.lm, col='salmon', lwd=2)

summary(Prestige.lm)

# t검정 => 회귀계수에 대한 검정
t.test(Prestige$income)


# --------------------------------------------------
# 선형회귀분석
# 임의의 데이터 셋 ==> 회귀식 찾기
# --------------------------------------------------

set.seed(14)
x <- runif(n=7, min=0, max=10)
y <- 3+2*x + rnorm(n=7, mean = 0, sd =5)
round(x, 2)
round(y, 2)


model<-lm(y~x, data=df)
coef(model)
intercept <-coef(model)[1]
slope <- coef(model)[2]
y.hat <- intercept + slope*x # 회귀식에 의한 예측값
round(y.hat, 2)
r <- y - y.hat   # 잔차 (관측값 - 예측값)
round(r, 2)









