# 귀무가설: 현금을 내는 손님이 팁을 낼 확률이 높다.
# 사분위

tips = read.csv('C:/Users/USER/Documents/R/tips.csv')

str(tips)
head(tips)

# 행과 열 출력
dim(tips)

# 컬럼명 확인
colnames(tips)

# 결측치 갯수 확인 => 0개
sum(is.na(tips))

# 성별 - 비율
tipstable <- table(tips$sex)
label <- paste(names(tipstable),'\n',round(tipstable/sum(tipstable)*100,1),'%',sep='')
pie(tipstable, col=c('#FEFBC1','#EAF8AB'), border='white', 
    labels = label, main="성별 비율")

# 식사시간 - 비율
timetable <- table(tips$time)
timetable
label <- paste(names(timetable),'\n',round(timetable/sum(timetable)*100,1),'%',sep='')
pie(timetable, col=c('#F7E4EE','#FEFBC1'), border='white',labels = label, main="식사 시간별 비율")


# 근처 식당의 금액대를 조사한다.
# 런치타임에 세트 메뉴를 넣는다.



# 식사 요일 - 비율
daytable <- table(tips$day)
label <- paste(names(daytable),'\n',round(daytable/sum(daytable)*100,1),'%',sep='')
pie(daytable,col=c('#FDF7F9','#FCEFF5','#F7E4EE','#F0D9E7'),labels=label,border='white',main='요일 비율')

# 팁 평균
mean(tip)

# 성별별 팁 평균
mean_tip_sex <- round(tapply(tips$tip, INDEX = tips$sex, FUN = mean),2)
bp <- barplot(mean_tip_sex, ylim=c(0,3.5),col=c('#FEFBC1','#EAF8AB'),border='#66266E', main='성별별 tip 평균')
abline(h=2.998279, col='red', lty=2, lwd=3)
text(x=bp, y=mean_tip_sex*0.9, labels=mean_tip_sex,cex=2)

# 금액별 빈도수
library(ggplot2)
ggplot(tips, aes(x = total_bill)) +
  geom_histogram(bins = 30, fill = "#7CB3FF", color = "white") +
  facet_wrap(~ time, ncol = 1) 

median(tip); max(tip); min(tip); var(tip); sd(tip); quantile(tip)
quantile(total_bill);


# 금액별 & 요일별 & tip과 total_bill 산점도
library(ggpubr)
tips$day <- factor(tips$day)
ggplot(tips, aes(x=total_bill, y=tip, color=day)) +
  geom_point() + facet_grid(.~time) + theme_pubclean() 


boxplot(tips$total_bill, main='total_bill', col=('#FEF8A2'))
boxplot(tips$tip, main='tip', col='#FFA2A4')


# 총 요금(total_bill)과 팁(tip) 사이의 상관관계를 시각화
# aes() 함수를 사용해 x축은 total_bill (총 결제액), y축은 tip (팁의 양)으로 지정하고, 색상은 day (요일)로 지정
# facet_grid() 함수는 시각화를 성별(sex)과 식사 시간(time)에 따라 구분하여 표시하기 위해 사용
# 따라서, 결과적으로는 성별과 식사 시간에 따라 4개의 서브플롯 생성
library(dplyr)
library(tidyr)
library(gridExtra)

ggplot(tips, aes(x=total_bill, y=tip, color=day)) +
  geom_point() + facet_grid(rows = vars(sex), cols = vars(time))
# geom_point() 함수를 사용하여 산점도를 그림
# facet_grid() 함수를 사용하여 그래프를 그리는 방식을 설정

#ggsave("tips_plot2.png", g, width = 10, height = 10, dpi = 300)



# 귀무가설 1) 식당에서 점심과 저녁 시간대에 팁의 비율은 차이가 없다
# 대랍가설 1) 식당에서 점심과 저녁 시간대에 팁의 비율은 차이가 있다

# 시간대별로 고객들이 팁을 얼마나 내는지에 대한 차이가 없다는 가설
# 검정 결과, p-value는 0.0002929로, 유의수준 0.05보다 작으므로 귀무가설 기각
# 따라서, 시간대별 팁 비율에 차이가 있다는 결론을 내릴 수 있음

library(tidyverse)

# 점심과 저녁 시간대에 해당하는 데이터 추출
time_tip <- tips %>%
  filter(time %in% c("Lunch", "Dinner")) %>%   
  select(time, tip)

time_tip

# 각 시간대별로 팁 비율을 계산
tip_pct <- time_tip %>%
  group_by(time) %>%
  summarize(mean_tip_pct = mean(tip / total_bill))
tip_pct

# 2개의 독립적인 표본 간의 평균 차이를 검정하는 t-test 실행
# 시간대별로 고객들이 팁을 얼마나 내는지에 대한 차이가 없다는 가설 이므로 't.testvar.equal 인자를 TRUE로 설정하여 등분산성을 가정
t_test_result <- t.test(tip ~ time, data = time_tip, var.equal = TRUE)
t_test_result

t_statistic <- t_test_result$statistic
t_statistic

p_value <- t_test_result$p.value
p_value


# 귀무가설 3) 식사 금액과 팁의 비율 사이에 상관관계가 없다.
# 대립가설 3) 식사 금액과 팁의 비율 사이에 상관관계가 있다.
# 상관분석 실행: cor.test() 함수는 total_bill 변수(식사 금액)와 tip 변수(팁의 양) 간의 상관분석
cor_test_result <- cor.test(tips$total_bill, tips$tip)
cor_test_result


# p-value가 매우 작게 나타남
# "식사 금액과 팁의 비율 사이에 상관관계가 없다"는 귀무가설 기각
# 즉, 식사 금액과 팁의 비율 사이에는 상관관계를 가진다고 할 수 있음


# 귀무가설: 성별간의 팁의 비율 차이는 없다. 
t.test(tip ~ sex, data = tips)

# p-value 값이 0.05보다 크다. 귀무가설 기각되지 않음
# 표준정규분포에서 p-value 영역을 시각화

p_val <- 0.1378
x <- seq(-4, 4, length.out = 1000) # x 축 표준화
y <- dnorm(x)
plot(x, y, type="l", lwd=0.5, lty = 3, xlab="팁의 비율", ylab="확률", main = '성별에 따른 팁의 비율')
abline(v = qnorm(p_val/2), col='#3366FF', lwd='2', lty = 3)
abline(v = qnorm(1-p_val/2), col='#3366FF', lwd='2', lty = 3)
abline(v = qnorm(0.05/2), col='#FFB847', lwd='2')
abline(v = qnorm(1-0.05/2), col='#FFB847', lwd='2')
legend("topright", legend=c("p-value","alpha"), col=c("#3366FF", "#FFB847"), lwd='2', cex=0.7)



