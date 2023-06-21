# CLT 실습 ---------------------------------
# 정규분포 모집단 --------------------------
# 평균 : 52, 표준편차: 5
# 데이터수: 10000
# 함수: rnorm()
n<-10000
nData<- rnorm(n, mean= 52, sd=5)
hist(nData, main='정규분포 형태의 모집단')
mean(nData)


#중심극한정리   
#X.norm <- rnorm(n=10000, mean=50, sd=25)
#hist(X.norm, col="orange", freq=F, ylim=c(0,0.02))
#mean(X.norm)
#sd(X.norm)

# 표본집단 => 샘플의 크기 : 10, 30, 50 (size)
# 모집단 데이터에서 샘플을 뽑는다.
X.bar <-c()
for (i in 1:10000){
  X.bar <- c(X.bar, mean(sample(nData, size=100)))
}
hist(X.bar, col="skyblue", freq=F)

# 표본집단(평균) => 샘플의 크기 : 10, 30, 50 (size)
for (i in 1:10){
  print(mean(sample(nData, size=30)))
}


# 균등분포 모집단 -------------------------
# 최소값 : 0, 최댓값: 1000
# 데이터수: 10000
# 함수: runif()
uData<-runif(n, min=0, max=100)
hist(uData, main='균등분포 형태의 모집단')


# 카이제곱분포 --------------------------------------------------
# 검정에 사용
# 자유도(df) 기준으로 확률분포 (누적확률, 확률밀도,..) 계산 
# ---------------------------------------------------------------

# 자유도(df)가 30, 확률변수 X가 43.77
# 확률밀도
# X에 대한 확률 
df = 30; x=43.77
dchisq(x,df)


# X에 대한 누적확률
pchisq(x,df) # <= X (디폴트: 작거나 같다)
pchisq(x, df, lower.tail = F) # >X


# 퍼센트에 해당하는 확률변수값
qchisq(0.95, df)


# 데이터 0~ 50 범위 200개 
# 자유도(df): 1~5
# 정규분포 그래프
df = 1; 

#for (i in 1:50){
#  graph = __(sample(dchisq(x, df), size=200))
#}

# 추측통계학
# 이항분포 가설 검증 -------------------------------------------------------
# 100번의 동전을 던져서 앞면이 60번 나왔다면, 공평한 동전이라 할 수 있나?
# x = 60(앞면), n = 100(100번 실행), p=0.5(성공 확률)
# 95 percent confidence interval: 신뢰구간에 포함됨
binom.test(x=60, n = 100, p =0.5)
# p-value > 0.05 귀무가설을 기각할 수 있음

# 이항분포와 가설검증
set.seed(2022)
X <- rbinom(n=10000, size =100, prob =0.5)
hist(X, col= 'lightgray', breaks =15, freq =F)
x <- seq(0,100,1)
curve(dnorm(x, mean(X), sd(X)), add=T, col='tomato', lwd=2)




qnorm(p=0.095, mean(X), se(X), lower.tail = T)


# 유의수준을 0.01로 결정 (신뢰수준 99% => 바꿀 수 있는 값)
binom.test(35, 100, 0.5, conf.level = 0.99)

# 표준오차

#표준정규분포로부터 10개의 표본을 뽑아 95% 신뢰구간을 구하는 것을 100번 반복 시,
# 몇 개의 신뢰구간이 모평균 0을 포함할지 확인

# 표준정규분포 모집단 데이터 생서 -------------------
set.seed(9)
n<-10
x<-1:100
y<-seq(-3,3,by=0.01)
smps<-


















