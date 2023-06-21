#1

x <- sample(1:6, 12, replace = T)
barplot(x)
y <- sample(1:6, 1200, replace = T)
y

hist(runif(12, 1, 6), col = 'orange', main = 'n=12')
hist(runif(1200, 1, 6), col = 'orange', main = 'n=1200')
hist(runif(12000000, 1, 6), col = 'orange', main = 'n=12000000')


#2
# X가 이항분포 B(10,0,0.2)일 경우, P[X=2]의 확률값은
# 10 : 반복 시행 횟수, 0.2 : 성공확률 값 

a <-seq(0, 10, by=1) # 임의
a

b <-dbinom(a, 10, 0.2)
plot(a, b)

c <-dbinom(a, 10, 0.1)
plot(a, c)

d <-dbinom(a, 10, 0.9)
plot(a, d)


#3 


































