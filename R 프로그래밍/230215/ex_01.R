# 기술적 통계 --- (2) 숫자 방식 특징 요약 ----------------------------------
# 외부데이터 로딩 ----------------------------------------------------------
filename = 'C:/Users/USER/Documents/R/cafedata.csv'
cafeData <-read.csv(filename, na.strings = 'NA')
str(cafeData)

# 특정 행 선택 및 출력 -----------------------------------------------------
cafeData[1]   # column
cafeData[1,]  # row
cafeData[34,] # 34 인덱스 행 선택


#결측치 체크 및 처리 -------------------------------------------------------
# 원소단위 NA 검사: is.na() => T, F : 체크
sum(is.na(cafeData))
sum(is.na(cafeData$Coffees))

# 행단위 NA 검사: 완전한 행: T, NA 존재하는 행: F
is.na(cafeData)
complete.cases(cafeData)


# na.omitt() 결측치 삭제 ---------------------------------------------------
na.omit(cafeData)


# 최빈값 -------------------------------------------------------------------
# 함수 제공 안됨, 줄기 잎 그림 활용 stem() 함수
# Coffee 컬럼에 대한 최빈값
# (1) 값의 갯수, 즉 빈도 (2) 빈도표에서 최댓값 찾기
coffee <- table(cafeData$Coffees)
coffee
max(coffee)

names(coffee)[which((coffee == max(coffee)))]


# 줄기 잎 그래프 -----------------------------------------------------------
# 숫자로 그래프 표현
data<-c(1,1,2,2,3,3,3,3,4)
stem(data)

data<-c(11,11,22,22,23,31,32,33,40)
stem(data)
stem(data, scale = 0.5)


data<-c(1,1,2,2,3,3,3,3,4,NA)
df <-data.frame(data)
df
df<-na.omit(df)
df

# stem() 함수
# 대표값은 평균값보다 중앙값을 사용한다. 평균값은 최소값과 최댓값이 변하면 값도 변하지만, 중앙값은 영향을 미치지 않는다.


# 표준편차

height <-c(164, 166,168,170,172,174,176)

#(1) 평균 > mean()
height.m = mean(height)
height.m

#(2) 편차 > 값 - 평균: 각 데이터별 평균과의 차
height - height.m

# (3) 분산 > 전체 데이터의 평균과의 거리(차)
sum(height - height.m)  # +,- 부호 때문에 상쇄
(height - height.m)^2   # 제곱근으로 처리


# 전체에 대한 분산 및 표준편차를 구한 값

#편차 제곱의 평균 즉, 분산
mean((height - height.m)^2)           # 분산 
# 표준편차 : 분산의 제곱근
sqrt(mean((height - height.m)^2))     # 표준편차


# R 함수 사용하여 분산 및 표준편차 구하기 ---------------------------------------------------
var(height); sd(height) # 일부 표본을 뽑아 분산 및 표준편차를 구한 값 

#따라서, R 함수와 전체 분산 및 표준편차 값이 다르게 나타난다.



# hist(히스토그램)

# 사분위수 : 이상치 판별에 응용 (데이터의 25%, 50%, 75%, 100%가 되는 값)
# quantile() 함수
# 책 14-15p




airquality

# 내장 데이터 확인
str(airquality)

# 컬럼명 확인
colnames(airquality)

# 행, 열 갯수
dim(airquality)

# 결측치 개수 확인
sum(is.na(airquality))

# 결측지 행 확인 
air_n = complete.cases(airquality)
air_n

# 결측치 없는 행만 추출 => 데이터[인덱싱]
airquality[1,]          # 1번행만 선택
airquality[air_n,]      # 결측치 없는 행만 선택

# 결측치 존재하는 행만 추출
airquality[!air_n,]     # T>F, F>T

# 결측지 삭제
airquality = na.omit(airquality)

# 특정 컬럼에 대한 통계량 (평균, 분산, 표준편차, 최빈값)
ozone = airquality$Ozone
ozone

# 평균
mean(ozone)

# 분산, 표준편차
var(ozone)
sd(ozone)

#최빈값
air <- table(ozone)
air

sort(air)
max(air)
which.max(air)

names(air)[which((air == max(air)))]

























