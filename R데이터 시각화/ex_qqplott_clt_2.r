# ------------------------------------------------------------------------
# 모집단 데이터
# ------------------------------------------------------------------------
population=c(1:10,40:50,90:100)
qqnorm(population)
qqline(population)


# ------------------------------------------------------------------------
# 표본 원소 갯수 20개, 표본 갯수 1 ~ 1000개
# ------------------------------------------------------------------------
par(mfrow = c(3, 2))

sample_num=20

Sample_Mean=numeric()

# 표본 크기 20개, 표본 수 1개 생성 및 평균값 저장 ==========================
for(i in 1) 
    Sample_Mean[i]=mean(sample(population,sample_num,replace=TRUE))

# 시각화
hist(Sample_Mean,freq=FALSE,main="s=20 n=1",xlab="Sample_Mean (n=1)")
lines(density(Sample_Mean))


# 표본 크기 20개, 표본 수 5개 생성 및 평균값 저장 ==========================
Sample_Mean=numeric()

for(i in 1:5) Sample_Mean[i]=mean(sample(population,sample_num,replace=TRUE))

hist(Sample_Mean,freq=FALSE,main="s=20 n=5",xlab="Sample_Mean (n=10)")

lines(density(Sample_Mean))


# 표본 크기 20개, 표본 수 10개 생성 및 평균값 저장 ==========================
Sample_Mean=numeric()

for(i in 1:10) Sample_Mean[i]=mean(sample(population,sample_num,replace=TRUE))

hist(Sample_Mean,freq=FALSE,main="s=20 n=10",xlab="Sample_Mean (n=30)")

lines(density(Sample_Mean))



# 표본 크기 20개, 표본 수 30개 생성 및 평균값 저장 ==========================
Sample_Mean=numeric()

for(i in 1:30) Sample_Mean[i]=mean(sample(population,sample_num,replace=TRUE))

hist(Sample_Mean,freq=FALSE,main="s=20 n=30",xlab="Sample_Mean (n=100)")

lines(density(Sample_Mean))


# 표본 크기 20개, 표본 수 100개 생성 및 평균값 저장 ==========================
Sample_Mean=numeric()

for(i in 1:100) Sample_Mean[i]=mean(sample(population,sample_num,replace=TRUE))

hist(Sample_Mean,freq=FALSE,main="s=20, n=100",xlab="Sample_Mean (n=500)")

lines(density(Sample_Mean))


# 표본 크기 20개, 표본 수 300개 생성 및 평균값 저장 ==========================
Sample_Mean=numeric()

for(i in 1:300) Sample_Mean[i]=mean(sample(population,sample_num,replace=TRUE))

hist(Sample_Mean,freq=FALSE,main="s=20, n=300",xlab="Sample_Mean (n=1000)")

lines(density(Sample_Mean))