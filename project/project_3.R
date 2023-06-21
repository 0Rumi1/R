# 귀무가설: 현금을 내는 손님이 팁을 낼 확률이 높다.
# 사분위

taxi = read.csv('C:/Users/USER/Documents/R/project/taxis.csv')


str(taxi)

# 행과 열 출력
dim(taxi)

# 컬럼명 확인
colnames(taxi)

# 결측치 갯수 확인
sum(is.na(taxi))

# 사분위수 (0/25/50/75/100)
attach(taxi)
summary(distance) # 거리 사분위
summary(taxi$tip) # 팁 사분위
max(tip)

# payment 공백이 포함된 44개 행 인덱스 확인
index=which(taxi["payment"]=="")
index


taxi <- round(tapply(tip, payment, FUN = mean))
taxi

# 거리가 0인 행 삭제
index4 = which(taxi['distance']==0)
index4


# 해당 행 삭제
taxi = taxi[-c(8,446,  492,  546,  622,  771,  914,  954, 1208, 1373, 1567, 1691, 1705, 1738, 1852,
               1846, 1915, 1927, 2339, 2430, 3095, 3358, 3779, 3789, 3969, 4216, 4370, 4460, 4501, 4548,
               4732, 4787, 4828, 4901, 4941, 5032, 5054, 5193, 5270, 5572, 5795, 5807, 6155, 6297), ]

index2=which(taxi$pickup_borough=="")
index2
taxi = taxi[-c(42,  603,  618,  667,  708,  963, 1101, 1944, 2120, 2723, 3066, 3239, 3623, 3866, 4094,
                       4103, 4256, 4388, 4742, 4908, 5226, 5455, 5585, 5599, 6042), ]
index3=which(taxi$dropoff_borough=="")
index3
taxi = taxi[-c(703,  730, 1098, 1215, 1767, 2064, 2154, 2205, 2375, 2543, 2876, 3210, 3467, 3627, 4012,
                       4179, 4422, 4765, 5551, 5585, 6052, 6246, 6288), ]


taxi <- round(tapply(tip, payment, FUN = mean), 2)
taxi


# 택시 payment - tip 
result = t.test(taxi$tip ~ taxi$payment, taxi)
result
result$conf.int

# 
bars <-tapply(taxi$tip, taxi$payment, mean)
lower <- tapply(taxi$tip, taxi$payment, function(x) t.test(x)$conf.int[1])
upper <- tapply(taxi$tip, taxi$payment, function(x) t.test(x)$conf.int[2])

library(gplots)
barplot(bars, space=0.4, ylim=c(0, 10),
        plot.ci=TRUE, ci.l=lower, ci.u=upper, ci.color="maroon", ci.lwd=4,
        names.arg = c("CASH", "CREDIT"), col=c('blue', 'red'),
        xlab="Payment", ylab='Tip', main='결제 방식에 따른 팁')

# 38  115  600  643  926 1033 1422 1822 2292 2629 2980 3101 3118 3254 3517 3754 3975 4117 4328 4388 4495 4787 5225
taxi[38]





