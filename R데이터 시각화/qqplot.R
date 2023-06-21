# 모집단 데이터

population =c(1:10, 40:50, 90:100)
qqnorm(population)
qqline(population)

# 표본 3000개, 표본 원소 갯수 1 ~ 1000개

par(mfrow = c(3,2))

Sample_Mean=numeric()

# 표본 크기 1개, 3000개 생성 및 평균값 저장
for(i in 1:3000)
  Sample_Mean[i] = mean(sample(population, 1, replace = TRUE)) # 각 샘플의 평균을 낸다.

# 시각화
hist(Sample_Mean, freq = FALSE, main = 'n=1', xlab="Sample_Mean (n=1)")
lines(density(Sample_Mean))

# v표본 크기 5개, 3000개 생성 및 
Sample_Mean=numeric()

for (i in 1:3000) Sample_Mean[i] = mean(sample)
