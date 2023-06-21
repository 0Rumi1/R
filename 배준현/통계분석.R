library(MASS)
str(survey)

levels(survey$W.Hnd)

#데이터프레임survey의 변수 W.Hnd의 범주별 빈도 출력
freq.tab <- table(survey$W.Hnd)
freq.tab


# freq.tab 의 범주별 구성비율
# Right 비율이 92%
freq.prop <- prop.table(freq.tab)
freq.prop

barplot(freq.tab, col='steelblue',
        xlab='Writing Hand', ylab='Frequency',
        main = 'Frequency table of wrting hand')


height <-survey$Height
length(height)

mean(height)

mean(height, na.rm=T) # Na 값 제외해서 계산

median(height, na.rm = T)

max(height, na.rm = T)

min(height, na.rm = T)

quantile(height, na.rm = T)
quantile(height, probs = c(0.25, 0.75), na.rm = T)

hist(height, col = 'steelblue', breaks = 15,
     xlim = c(140, 210), ylim = c(0,50))


head(survey)

# 특정 조건을 만족하는 일부 자료 선택하는 함수
# https://mansoostat.tistory.com/28
df <- subset(survey, select = c(2,3,6,10,12))
summary(df)

install.packages('stargazer')
library(stargazer)
stargazer(survey, type= 'text', tile = 'Summary of survey dataset')


mean(survey$Pulse, na.rm = T)
table(survey$Sex)
table(survey$Exer)

# 주어진 함수를 그룹별로 각 자료 값에 적용하는 함수
# x 평균을 구할 변수, index 그룹 변수, fun 평균 구할 함수
# 여성의 Pulse 가 남성보다 2 값이 큰데, 이것이 통계적으로도 유의한 것인지 알고 싶으면 t-test
tapply(survey$Pulse, survey$Sex, mean, na.rm = T)

with(survey, tapply(Pulse, Sex, mean, na.rm = T))

with(survey, tapply(Pulse, Exer, mean, na.rm = T))

with(survey, tapply(Pulse, list(Sex, Exer), mean, na.rm = T))

aggregate(survey$Pulse, by = list(survey$Exer), FUN = mean, na.rm = T)

with(survey, aggregate(Pulse, list(Exer), mean, na.rm = T))
with(survey, aggregate(Pulse, list(Exercise=Exer), mean, na.rm = T))


install.packages('vcd')
library(vcd)
str(Arthritis)
head(Arthritis)

#  두 변수의 범주별 빈도수를 통해 범주형 변수 간의 관계를 파악
table(Arthritis$Improved, Arthritis$Treatment)
with(Arthritis, table(Improved, Treatment))
xtabs(~ Improved + Treatment, data=Arthritis)


# 모자이크
mosaic(Improved ~ Treatment, data=Arthritis, gp = shading_max)


# 교차표의 행과 열을 기준으로 빈도수의 합과 비율 계산
cross.tab <- with(Arthritis, table(Improved, Treatment))

margin.table(cross.tab, margin = 1)
margin.table(cross.tab, margin = 2)

prop.table(cross.tab)
prop.table(cross.tab, margin = 1)
prop.table(cross.tab, margin = 2)


addmargins(cross.tab)

addmargins(cross.tab, margin = 1)
addmargins(cross.tab, margin = 2)


library(gmodels)
with(Arthritis, CrossTable(Improved, Treatment, prop.r = F, prop.c = F, prop.t = T, prop.chisq = F))

# 다차원 테이블 : 세 개의 범주형 변수 간의 관계 파악
cross.tab <- with(Arthritis, table(Improved, Sex, Treatment))
ftable(cross.tab)
ftable(cross.tab, row.vars = c(2,3))
# 신약 처방을 받은 여성의 59.3%는 현저한 정상의 개선(Marked)이 있으며,
# 반면에 남성의 경우에는 그 비율이 35.7%에 그쳤다
ftable(prop.table(cross.tab, margin = c(2,3)))

















