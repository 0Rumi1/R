# 2010년도 인구주택조사 데이터 , 남 출생아 수를 기록한 이산형 자료

boydata <-read.csv('C:/Users/USER/Documents/R/2010_1%_인구사항_20230214_48383.csv', header = F)

boydata
str(boydata)
dim(boydata)


boydata$V1 <- factor(boydata$V1, levels=1:2, labels = c('남아출생수', '여자'))
str(boydata)

table(boydata$V5)
barplot(table(boydata$V5), main = '남아출생수', xlab = '출생 수',ylab='수치',col = 'blue')


# 연령대별 히스토그래프(Hist) #10대,20대,.... or 청년, 중년, 장년, 노년


# 원그래프 (pie)
# 질적자료에서 각 범주가 차지하는 비중 비교
# table() 함수 이용하여 자료 요약 후 사용

#pie(x, y, main,,,,)
#table(one or more objects)


#1. R에서 데이터 자료형 분류, 데이터 자료형의 특징, 저장 데이터 타입

# (https://warm-uk.tistory.com/68) 참고


# 벡터(vector) --------------------------------
# - 벡터는 한가지 데이터 타입만을 저장할 수 있는 1차원 배열
# - 숫자만 저장하는 벡터, 문자만 저장하는 배열 존재
# - c()를 사용하여 생성 c는 combine을 의미한다.


# 행렬(matrix) --------------------------------
# - 행렬은 한가지 데이터 타입만을 저장할 수 있는 2차원 데이터 배열
# - matrix()를 사용하여 생성
# - 생성 시 미리 크기를 지정해야 한다. (nrow=, ncol=)
# - 행렬 생성, 기본적으로 열이 기준이다.

# 배열 -----------------------------------------
# - 3차원 이상의 형태로 데이터를 모아 놓을 수 있다.
# - 한 가지 데이터 타입만을 저장
# - array()함수를 사용하여 생성


# 리스트(list) ----------------------------------
# - 서로 다른 데이터를 인위적으로 묶음
# - 구성요소로 어떤 데이터 형태도 가질 수 있는 1차원 데이터형
# - 리스트 안에 벡터, 혹은 다른 리스트, 데이터프레임 전부 들어올 수 있음



# 데이터프레임 ----------------------------------
# - 구성요소로 어떤 데이터 형태로든 가질 수 있는 2차원 데이터 타입이다.
# - Column마드 데이터 타입이 다를 수 있다. (숫자, 문자, factor 다 다를 수 있다.)
# - 테이블이다.
# - data.frame()으로 생성



#2. 메타데이터란?
# 구조화 데이터를 의미하는 메타데이터(metadata)는 데이터로 다른 데이터를 설명해 주는 것을 의미
# 실제로 존재하여 사용할 수 있는 동영상이나 소리, 사진, 문서 등의 형태가 아닌 실존하는 데이터를 설명하기 위해 직접적 또는 간접적으로 관련 정보를 제공해 주는 데이터


#3. 기술적통계 방식으로 데이터 표현
#-> 데이터 :  사회일반 > 가족실태조사 > 총괄(제공) > 2020
#-> 추출 데이터 : 지역, 가족원합계, 세대구성, 가구구성, 교육정도_학력

# 데이터 불러오기
famdata = read.csv('C:/Users/USER/Documents/R/2020_총괄_20230214_82779.csv')
dim(famdata)
colnames(famdata)
str(famdata)
tail(famdata)

# 컬럼명 변경
colnames(famdata) = c('지역', '가족원합계', '세대구성', '가구구성', '교육정도_학력')
colnames(famdata)
famdata

mean(famdata$세대구성)

#(3-1) 지역
#- 지역별 세대구성 비중, 가구구성 비중
#- 가장 많은 세대구성, 가구구성,  가장 적은 세대구성, 가구구성,  평균 세대구성, 가구구성

# 지역별 최대 세대구성 및 가구구성
tapply(famdata$세대구성, famdata$지역, max)
tapply(famdata$가구구성, famdata$지역, max)

# 지역별 최소 세대구성 및 가구구성
tapply(famdata$세대구성, famdata$지역, min)
tapply(famdata$가구구성, famdata$지역, min)

# 지역별 평균 세대구성 및 가구구성
tapply(famdata$세대구성, famdata$지역, mean)
tapply(famdata$가구구성, famdata$지역, mean)



#(3-2) 가족원합계
#- 전체에 대한 비중으로 표현
#- 가장 많은 가족원 수, 가장 적은 가족원 수, 평균 가족원 수

max_famnum = max(famdata$가족원합계)
max_famnum

min_famnum = min(famdata$가족원합계)
min_famnum

mean_famnum = mean(famdata$가족원합계)
mean_famnum

#(3-3) 세대구성
#- 세대구성별 수
#- 1인가구 수와 나머지 세대구성 수 비교
fam_group = tapply(famdata$세대구성, famdata$세대구성, sum)
barplot(fam_group, , names.arg = c('1인', '2인', '3인', '4인', '5인', '6인'), xlab = '세대구성', main = '세대구성 별 수', col = 'beige')

#(3-4) 가구구성과 교육정도_학력
#- 가족구성와 학력의 관계
fam_edu = tapply(famdata$교육정도_학력, famdata$가구구성, mean)
fam_edu

barplot(fam_edu)
