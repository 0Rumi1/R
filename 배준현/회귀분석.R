library(HistData)
str(GaltonFamilies)

df <- GaltonFamilies

plot(df$midparentHeight, df$childHeight,
     pch = 19, col = adjustcolor('blue', alpha.f=0.3))


# 상관계수 계산
# 0에 가까울수록 두 변수간의 선형관계가 없음
cor(df$midparentHeight, df$childHeight)

# 상관계수에 대한 유의성 검증: 모집단에서의 상관계수가 0이라는 귀무가설 검정
with(df, cor.test(midparentHeight, childHeight))

with(df, cor.test(midparentHeight, childHeight, alternative="greater", conf.level=0.99))



# lm
model <- lm(childHeight ~ midparentHeight, data = df)
model

plot(df$midparentHeight, df$childHeight,
     pch = 19, col = adjustcolor('blue', alpha.f=0.3))
abline(model, col='tomato', lty=1, lwd=3)


