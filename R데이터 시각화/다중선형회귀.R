# 다중 선형회귀
# 종속변수에 영향을 미치는 독립변수가 여러개일 경우

# 회귀계수는 독립변수의 갯수만큼 나온다.

# 내장 데이터셋 mtcars
# 독립변수, 종속변수
# 회귀모델 생성
# 회귀계수만 출력
# --------------------------------------------------------------------------------

mtcars

cor(mtcars)

df = data.frame(wt = mtcars$wt, disp = mtcars$disp)
df


plot(mtcars$disp, mtcars$wt, main='disp - wt', col='blue', pch=20, cex=2)

shapiro.test(df$wt)
shapiro.test(df$disp)

qqplot(df$disp, df$wt)


model <- lm(df$disp~df$wt, data=df)
model

summary(model)

mCoef <- coef(model)[1]
mCoef


pre_y = coef(model)[2]*df$wt + mCoef
pre_y


# 잔차

r_err<- sum((df$disp - pre_y)^2)
r_err


pre_value<-round(fitted(mModel),1)
pre_value

x<-1:dim(mtacrsDF)[1]
x

plot(x, pre_value, col='blue', pch=20, cex=2)

# 예측 함수 => predict(모델객체)
predict()

library(car)
Prestige

sData<-scale(Prestige$income)
mean(sData); sd(sData)

mean(Prestige$mean)























