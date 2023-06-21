# 베르누이 시행 
# 가능한 결과가 두개뿐이고, 성공의 확률이 정해져 있는 확률 시행 예) 동전 던지기

# rbinom(n, size, prob)

x <- rbinom(10, 1, 0.5)
x

sum(x)/10
mean(x)

x <- rbinom(100, 1, 0.5)
mean(x)

x <- rbinom(1000, 1, 0.5)
mean(x)


# 몬테카를로 시뮬레이션
# 충분히 큰 횟수의 시행을 통해서 복잡한 확률을 계산하는 방법
# sample(x, size, replace=FALSE, prob=NULL)

sample(1:10, 10, replace = T)
sample(1:10, 10, replace = F)


# 난수 생성
runif(n, min=0, max=1)

# 원주율 계산
n_sim <- 1000
x <- vector(length = n_sim)
y <- vector(length = n_sim)

res = 0
for (i in 1:n_sim) {
  x[i] <- runif(1)
  y[i] <- runif(1)
  if (x[i]^2 + y[i]^2 < 1) {
    res <- res + 1
  }
}

4 * res/n_sim

circle <- function(x) sqrt(1 - x^2)
plot(x, y, xlab='x', ylab = 'Y', col='blue')
curve(circle, from = 0, to = 1, add = T, col='red', lwd=2)


n_sim <- 10000
n_odd <- 0
n_five <- 0

for (i in 1:n_sim) {
  trial = sample(1:6, 1)
  if (trial %% 2 == 1) n_odd <- n_odd + 1
  if (trial == 5) n_five <- n_five + 1
}

n_five /n_odd
p_odd <- n_odd/n_sim
p_odd
p_five <- n_five / n_sim
p_five/p_odd



# 베이즈 정리의 확률 해석
# 확률은 사건의 발생에 대한 기대치의 계산과 그것이 실제로 발생할 것으로 기대되는 가능성 간의 비율
# 즉, 과거의 데이터를 보면 미래 예측

n_sim <- 10000 # 검사 횟수
prevalene <- 0.001 # 유병율

# 검사의 민감도, 특이도
sensitivity <- 0.99
specificity <- 0.99

n_total_positive <- 0 # 전체 질환 케이스 수
n_true_positive <- 0 # 실제 환자 수
n_false_positive <- 0 # 오진 케이스 수



for (i in 1:n_sim){
  disease <- rbinom(1, 1, prevalene)
  if (disease == 0) { # 실제 병이 없는 경우
    diagnosis <- rbinom(1,1,1-specificity)
    if (diagnosis == 1){
      n_total_positive <- n_total_positive + 1
      n_false_positive <- n_false_positive + 1
    }}
  
  if (disease == 1) { #실제 병이 있는 경우
    diagnosis <- rbinom(1,1, sensitivity)
    if (diagnosis == 1){
      n_total_positive <- n_total_positive + 1
      n_true_positive <- n_false_positive + 1
    }}
}


n_total_positive
n_true_positive
n_false_positive

n_false_positive/n_total_positive


