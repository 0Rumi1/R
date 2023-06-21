# 확률
?rbinom

# 확률분포: 확률변수가 특정 값을 가질 확률

# 표본 크기에 따른 산술확률과 통계확률 비교 ======================
# 시행횟수가 많아질수록 통계적 확률은 기댓값에 가까워짐
x<-rbinom (10, 1, 0.5) # 10번 반복 1개 뽑음

sum(x)/10; mean(x)  

x<-rbinom (100,1, 0.5)
sum(x)/100; mean(x)

x<- rbinom(1000,1,0.5)
sum(x)/1000; mean(x)


# sample() : 몬테카를로
sample(1:10, 3) # 3개를 뽑는다.
sample(1:2, 10) # 오류 발생,모집단보다 큰 샘플을 가질 수 없다.

# 복원추출
sample(1:2,10, replace=T) # replace = T 복원해서 다시 샘플을 뽑기

# 비복원추출 : 표본을 추출하고나서 원래대로 돌려놓지 않고 다음 뽑기를 하는 방법
sample(1:2)

# 추출 확률 지정: 편향된 데이터를 가지고 있을 시, 표본을 추출할 때 비율을 조절하기 위함
sample(1:2, 10, replace=T, prob = c(0.8,0.2))


# 난수 생성 함수
runif(1) # 0~1 사이
runif(10, min=1, max=10) # 범위 지정: min~max


# 확률변수
# 동전을 두번 던져 앞면이 나오는 횟수로 X가 가지는 값은 {0,1,2}
# 각각 등장할 확률은 {1/4,1/2,1/4}
x <- c(0,1,2) # 확률변수가 취할 수 있는 값
px <- c(1/4, 2/4, 1/4)
EX <- sum(x*px)
EX # 평균

# 확률변수의 분산
VX<- sum(x^2*px) - EX^2
VX


n_sim <- 10000   # 시행 횟수
n_odd <- 0       # 홀수
n_five <- 0      # 주사위 5
for (i in 1:n_sim) {
  trial = sample(1:6, 1)
  if (trial %% 2 == 1) n_odd <- n_odd + 1
  if (trial == 5) n_five <- n_five + 1
}
n_five / n_odd   # 홀수 중에서 5가 나올 확률
p_odd <- n_odd / n_sim
p_five <- n_five / n_sim
p_five / p_odd


# 모집단과 표본
dbinom(7, 10, prob=0.5) # 10번 시행시, 숫자면이 7면 이하가 나올 확률 


# 주사위를 여러번 굴려 나온 눈을 관찰
#x <- sample(1:6, 12, replace = T)
#x
#y <- sample(1:6, 1200, replace = T)
#y
#z <- sample(1:6, 12000000, replace = T)if
#z

hist(runif(12, 1, 6), col = 'orange')


# 균일분포 (uniform) : 특정 범위 내에서 균등하게 나타나는 확률을 가지는 확률분포
hist(runif(100, 0, 100), col = "orange")
hist(runif(1000, 0, 100), col = 'salmon')
hist(runif(10000, 0, 100), col = 'red')

# 이항분포
# dbinom() 함수: 이항분포의 확률값

# X가 이항분포 B(10,0,0.2)일 경우, P[X=2]의 확률값은
# 10 : 반복 시행 횟수, 0.2 : 성공확률 값 
dbinom(2,10,0.2)

#성공과 실패 확률에 대한 성공 분포
b <-dbinom(a, 50, 0.2)
plot(a, b)

b <-dbinom(a, 50, 0.6)
plot(a,b)


a <-seq(0, 50, by=1)
a

b<-dbinom(a, 50, 0.2)
b
plot(a, b)

a <- dbinom(2, 10, 0.5)
plot(a, b)

B(10,0.5)


# pbinom() 함수: 이항분포의 누적확률값
pbinom(3,10,0.2)


# 정규분포
# 중심에 데이터가 집중되어 있고 좌우는 작은 데이터가 아주 작은 종형태의 분포
# X ~ N(172,10^2), 경북대 대학원학생들의 키, 평균: 172, 표준편차 10이라고 알려진 경우
# => 규격화 ---> 표준정규분포 : 평균 0, 표준편차 1
# 키 평균: 172, 표준편차: 10

set.seed(2022)
X<-rnorm(n=1000, mean=172, sd = 10)
X

mean(X) # 평균
sd(X)   # 분산

# 그래프
hist(X, col = 'skyblue', breaks = 30)



# 키가 160보다 크거나 180보다 작을 확률
pnorm(q = 160, mean = 172, sd=10) # 160보다 작거나 같다.
pnorm(q = 160, mean = 172, sd=10, lower.tail = F) # 160보다 크다
pnorm(q = 180, mean = 172, sd=10)
pnorm(q = 180, mean = 172, sd=10, lower.tail = F)






















