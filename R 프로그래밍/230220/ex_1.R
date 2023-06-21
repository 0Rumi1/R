# T-분포----------------------------------
# 정규분포 모집단에서 표본추출
# ----------------------------------------
t_value=3.98
dt(t_value, df=19)

# 누적값
# 기본값 : <= 3.98
# https://math100.tistory.com/43 => t분포표 
pt(t_value, df=19)

# 변경 : >3.98
pt(t_value, df=19, lower.tail = FALSE)

# 퍼센트에 해당하는 확률값
qt(0.95, df=19) # 95%
qt(0.5) #50%
qt(0.25) #25%
qt(0.25) #25%
qt(0.05, df=19)
qt(0.25, df=19)


# T-분포기반 T-검정

#데이터 확인
library(MASS)
str(cats)


# 귀무가설 : 고양이 몸무게는 2.6kg 입니다.
h0 = 2.6
data = cats$Bwt # one sample 
# 검정
result = t.test(data, mu=h0)
result


# 귀무가설: 고양이 몸무게는 2.7kg 입니다.
h0=2.7
data = cats$Bwt
#검정
result = t.test(data, mu=h0) # p-value 값이 0.5를 넘는다. 즉, 귀무가설 지지
result
str(result) # 리스트
result$p.value
result$conf.int


# 호주 대학생 전체의 평균키는 175 입니다. 

library(MASS)
t.test(survey$Height, mu=175)


# 가설 변경
# 172 이다. vs 아니다.
t.height <- t.test(survey$Height, mu=172)
str(t.height)


# 가설 변경
#171 이다. vs 아니다. 
t.test(survey$Height, mu=171, conf.level = 0.99)


# 독립표본, 평균검정
# 고양이 성별과 몸무게와의 관계
t.test(formula=Bwt ~ Sex, data=cats)

#data=cats$Bwt












