# ----------------------------------------------------
# 상관관계 & 상관분석
# - 상관계수(Correation Cofecient): -1 ~ 1
#
# ----------------------------------------------------

# 다른 R 스크립트 파일 포함
source('C:\\Users\\USER\\Documents\\R\\utils\\util.R')


# 데이터준비 - 내장 데이터셋 cats
# 기본 정보 확인

library(MASS)
displayInfo(cats)
#str(cats)

# 범주형 데이터 > 팩터로 변경
#summary(cats)


# 전처리 --------------------------------------------
#(1) 결측치 => 원소단위 is.na(), 행단위 complete.case()

sum(is.na(cats))
sum(complete.cases(cats)) # 완전한 행
checNa(cats)

#(2) 최빈값 => 요소에 대한 빈도 테이블, 최빈값 체크
for (col in colnames(cats)) # 특정 컬럼에 대한 빈도 테이블
{
  if ('numeric' == print(class(cats[col][1])))
  table(cats[col])
}

class(cats["Bwt"][1,1])
cats[2]


# (3) 이상치/특이값 체크
# => 과제



# 기술통계 분석 - 그래프 방식 -----------------------
# 컬럼/변수 2개에 대한 산점도
# 포뮬러 형식 : 종속 ~ 독립

# 종속변수 : 심장무게
# 독립변수 : 몸무게
plot(cats$Hwt ~ cats$Bwt, main='고양이 무게에 따른 심장무게',
     xlab='몸무게(Bwt, kg)', ylab='심장무게(Hwt,g)')


# 기술통계 분석 - 통계함수/ 수치 방식 -----------------------
# (1) 변수/컬럼의 상관관계 체크
# => 정규분포 여부 ==> 계산 방법 선정
# (1-1) 정규성 검정
# 정규성 테스트 시, 사피론 테스트 실행(정규분포)
shapiro.test(cats$Hwt)
shapiro.test(cats$Bwt)
shapiro.test(as.fector(cats[2:3]))

class(cats[2:3])
as.vector()


# (1-2) 상관계수 계산 방법 결정 및 계산 
# => 몸무게랑 심장무게랑 양의 상관관계가 있다.

cor(cats$Hwt, cats$Bwt)
cor(cats$Hwt, cats$Bwt, method = 'spearman')
cor(cats$Hwt, cats$Bwt, method = 'kendall')

# => 0.5보다 크므로, 서로 연관성이 있다고 볼 수 있음



# 검정 -----------------------------------------------------------
# 귀무가설 => 모집단에서의 상관계수가 0이다. 즉, 관련없음 (기본)
# 0보다 클수도, 작을 수도 있다. => 양측 검정 실행
# 귀무가설이 10보다 크다. 이면, 반대는 10보다 작다로 단측 검정을 실행

cor.test(cats$Hwt, cats$Bwt)
cor.test(cats$Hwt, cats$Bwt, method = 'kendall')

cor.test(x, y,
         alternative = c('two.sided', 'less', 'greater'),
         method = c('person', 'kendall', 'spearman'),
         exact = Null, conf.level = 0.95, continuity = FALSE, ..)



# 데이터 준비 - 내장 데이터셋 iris--------------------------------
# (1) 데이터 기본 정보 확인

displayInfo(iris)

# 전처리 ---------------------------------------------------------
# (1) 결측치 체크
checkNa(iris)

# (2) 최빈값 체크 <-- NA가 아닌 이상 데이터 확인
checkMode(iris)

# 기술통계 분석 - 수치 방식 -------------------------------------------------
#fivenum(iris[-5])


# 세 개 이상의 변수가 간의 상관계수 유의성 검정:

# 4개 컬럼들의 상관계수 검정
install.packages('psych')
library(psych)

iris.cor = cor(iris[,-5])
class(iris.cor)
str(iris.cor)
iris.cor['Petal.Width', 'Petal.Length']


corr.test(iris[-5])


install.packages('corrgram')
library(corrgram)
corrgram(iris[-5], upper.panel=panel.conf)


# -------------------------------------------------------------------------------------------------
# 편상관관계 & 편상관계수
# > 두 변수의 상관관계에 영향을 미치는 제 3의 변수에 의해서 잘못 검사된 상관계수 도출 가능성 있음
# > 해당 문제를 해결하기 위한 제 3의 변수를 제어(통제)해서 상관계수값 추출 하도록 함
# ------------------------------------------------------------------------------------------------- 

# 내장 데이터셋 - mtcars ---------------------------------------------------------------------------

# mtcars 데이터 정보 확인
displayInfo(mtcars)

# 전처리 ------------------------------------------------------------------------------------------
# (1) 결측치 체크 
checkNa(mtcars)

# (2) 최빈값 체크
checkMode(mtcars)

# 데이터와 데이터 타입 체크
# 숫자 또는 문자 => 범주형
mtcars2 <- within(mtcars, {
  vs<-factor(vs, label = c('V', 'S'))
  am<-factor(am, label = c('auto', 'menu'))
  cyl<-ordered(cyl)
  gear<-ordered(gear)
  carb<-ordered(gear)
})

displayInfo(mtcars2)

# 기술통계 분석 -----------------------------------------------------------------------------------

colnames(mtcars)
mtcars2 <- mtcars[,c('mpg', 'cyl', 'hp', 'wt')]
mtcars.cor<-cor(mtcars2[-c(2,8:11)])[,'mpg']
# 연비 - 마력(hp), 실린더(cyl), 무게(wt) 상관계수값 확인

# mpg와 상관계수가 가장 높은 컬럼과 가장 낮은 컬럼
# (1) mpg와 나머지 컬럼과의 상관계수 값 추출
mtcars.cor[,'mpg']

# (2) 정렬 또는 가장 높은 컬럼과 가장 낮은 컬럼
class(mtcars.cor[,'mpg'])

#mpg컬럼만 추출 mpg 데이터 제거
corData<-mtcars.cor[,'mpg']
corData<-corData[-1]

# 최대값, 최소값
max(corData)
min(corData)

# 정렬 후 저장
ret<-sort(corData)
ret

#범주형 제거 후 상관계수 전체
cor(mtcars2[-c(2,8:11)])


# ggm 패키지의 pcor() 함수
# 편상관계수에 대한 유의성 검정
install.packages('ggm')
library(ggm)

# 상관계수값 확인 후 2개 변수 선택 ------------------------------
# 연관성있는 변수 선택
# pcor(u, s)




















