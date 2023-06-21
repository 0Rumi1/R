
x_mat <- matrix(rnorm(100), 20, 5)
rnorm 

# 정규분포는 데이터 분석이나 머신러닝에도 많이 쓰임

apply(x_mat, 2, mean)
apply(x_mat, 1, sum)
apply(x_mat, 2, var)
apply(x_mat, 1, var)

set.seed(123)
rnorm(100)

#paste: 문자열을 이어 붙여서 하나의 문자열로 만듦

myname <- 'Woo chang'
paste('my name is', myname) # 띄어쓰기가 디폴트 (sep = " ")
paste0('my name is', myname)

#file name
file_id = 1533
paste("Dataset_", file_id, ".txt", sep="")


#nchar(문자열) : 문자열의 갯수를 세는 함수

test <- c('abcdefg', 'AFFY1245820')
nchar(test)

#substr: 문자열에서 부분을 추출하는 함수
#substr(문자열, 시작위치, 마지막위치)

f_name <- 'AFFY1245820'
substr(f_name, 5, nchar(f_name))


#현재 작업폴더
getwd()

# setwd: 작업폴더 위치 설정
# 바탕화면에 저장
setwd("C:/Users/USER/Desktop")

# R에서 제공하는 자료 편집기 이용
# 데이터 프레임 형태의 자료를 입력할 떄 용이
dat = data.frame() # 비어있는 데이터 프레임
dat = edit(dat)
dat


# scan 함수를 이용한 자료의 입력
# 작업 폴더 위치 설정한 공간에 파일을 저장해야한다.
x = scan(file = 'input_noh.txt', what = numeric())
x
x = scan(file = 'input_noh.txt', what = character())
x
x = scan(file = 'input_noh.txt')
x


# read.table 함수를 이용한 자료의 입력
dat = read.table(file ='input_noh.txt')
dat
dat = as.vector(read.table(file ='input_noh.txt')) # 벡터 형태로 변경해봄
dat
dat2 = raed.table(file = 'input_noh.txt', header = T)


# read.csv 함수
# 데이터 불러오기
dat = read.csv('개인정보.csv', header = T, fileEncoding = 'euc-kr')
dat

# 키, 몸무게 뽑기
dat_info <- dat[,c(2,3)]
dat_info

#
stat_info <-c('평균', '중앙값', '분산')
stat_info

mean_info <-apply(dat_info, 2, mean)
mean_info <-as.vector(c('평균', mean_info))
mean_info

nrow(dat)

dat[(nrow(dat)+1),] <- mean_info
dat

dat[6,] <- mean_info
dat[6,]

median_info <-apply(dat_info,2,median)
median_info <-as.vector(c('중앙값', median_info))
median_info

#dat[7,] <- median_info
dat[(nrow(dat)+1),] <- median_info
dat

var_info<-apply(dat_info,2,var)
var_info<-as.vector(c('분산', var_info))
var_info

#dat[8,] <- var_info
dat[(nrow(dat)+1),] <- var_info
dat

write.csv(dat, '작업완료.csv')



# 문자열의 요인 자동변환 방지: stringsAsFactors = F 옵션
dat2 = read.csv(file = 'test3.txt', stringsAsFactors = F) # or options (stringsAs)
dat2

# write.csv 함수
write.csv(dat2, 'rumi.csv')


# cat 함수를 이용한 화면 출력 및 파일 출력
#형식: cat(객체, file='path', sep='\n'/'\t')
#반복문에서 현재 반복 횟수를 출력할 때 자주 쓰임

x <- 1:10
cat(x, file = 'x.txt', sep='\n') #output to a file
cat(x, sep='\t') # output to a screen
cat('\n', 1, 'st element of x =', x[1])


# write.table 함수를 이용한 파일 출력
x1 <-1:20
x2<- rep(c('A', 'B', 'B', 'A'),5)
x3<- rep(c(T,F), each=10)
dat<- cbind(x1,x2,x3) # 문자열로 모두 변환됨
dat<- data.frame(x1,x2,x3) # 데이터프레임으로 만들기
#cbind, 인덱스가 고정되어 있음, data.frame > dataframe 이름 설정 가능

write.table(dat, file='test1.txt', row.names =T, col.names=T, quote = T, sep='\t')
write.table(dat, file='test2.txt', row.names =F, col.names=F, quote = T, sep='\n')
write.table(dat, file='test3.txt', sep=", ")

#head or tail: 자료의 처음, 끝 부분을 출력
dat = read.csv(file='test3.txt')
head(dat)
tail(dat)

length(dat[,1])
dim(dat)
dim(dat)[1]
dim(dat)[2]
nrow(dat); ncol(dat)


# 결측값 확인 (NA)
# is.na 함수 사용: NA값이면 TRUE 아니면 FALSE 반환

x <- matrix(c(NA, 1,3,NA, NA, 2),3,2)
x
is.na(x)
sum(is.na(x)) # number of missing values

#결측값의 위치 확인
#which 함수: TRUE 값을 갖는 인덱스를 반환

which(is.na(x)) # 1차원위치
which(is.na(x), arr.ind=T) # 2차원 위치(row, col별 위치를 행마다 알려줌)
which(is.na(x),T) # 2차원 위치(row, col별 위치를 행마다 알려줌)


# 논리 연산(if) 예제
x<- 1:5
y<- -2:2

if(any(x>0)) {print(x)}
if(any(y<0)) {print(abs(y))} # 절대값 abs 
if(any(y<0)) {
  print(abs(y))
  cat("\n y contains negative values")
}


# 예제
if(pi>3) {cat('\n expr(T)')} else {cat('\n expr(F)')}
if(pi<3) {cat('\n expr(T)')} else {cat('\n expr(F)')}


x <- 1:5
lenght(x)
sum(x)
if(length(x)==5){
          if (sum(x)==15){cat('\n Vector x length=',length(x),'sum=', sum(x))}
          else{cat('\n Vector x length !=', length(x))}
                  }

# 예제 - 2차방정식 근 구하기

a<-1;
b<-2;
c<- -3

as.numeric(a)
as.numeric(b)
as.numeric(c)
D <- (b^2-4*a*c)

if(D > 0) {x = (-b + (sqrt(D))/2*a)
} else{
    cat('No roots')}
x


if(D>0){
rt = c((-b-sqrt(D))/(2*a), (-b+sqrt(D))/(2*a))
      } else if (D==0) {
  rt = -b/(2*a)
  } else {
cat('\n No roots')
}

rt


#ifelse(논리벡터, 참일 때, 거짓일 때)

# 예제
# 시험저수를 매겨, 50점 이상이면 pass, 아니면 fail

x = c(10,3,6,9)
y = c(1,5,4,12)
ifelse(x>y,x,y)

score = c(80,75,40,98)
grade = ifelse(score >=50, "pass", 'fail')
data.frame(score, grade)


# 예제 여러 조건
y <- -2:2
ifelse(y>=0, y,-y)
abs(y)

tmp<-c(3,-1,1,-2,0)
sn=ifelse(tmp>0,'pos',
   ifelse(tmp<0,'neg', 'zero')
   )
data.frame(tmp,sn)

#swith 문

switch문
여러 값에 대하여 각각 다른 처리를 하고자 할 때 사용
# switch(변수, 1에 해당 표현식, 2에 해당 표현식,..)

# 예제
x <- c(1,3,2,5,2)
i <- 2
switch(i, mean(x), median(x), sd(x), var(x)) # i =2 이므로, 두번쨰에 위치한 median 으로 실행
# i = 1 이며, mean 으로 실행 
i <- (1:5)
i

# if (조건문) {
#      실행할 식
#} else if (조건문) {
#  실행할 식
#}  else (조건문) {
#  실행할 식
#}f

i<-3
if (i==1) {
  mean(x)
} else if (i==2) {
  median(x)
} else if (i==3) {
    sd(x)
} else {
  var(x)
}

switch(i, ifelse(mean(x),
    ifelse(median(x),
    ifelse(sd(x),
    ifelse(var(x))))
    ))



type <- 'var'
switch(type, mean=mean(x), sd=sd(x), var=var(x))
#type <- 'sd', type <- 'var' 의 경우도 실행

switch(i, ifelse(mean(x),
        ifelse(median(x),
        ifelse(sd(x),
        ifelse(var(x))))
        ))


type <-'mean'
if (type=='mean') {
  mean(x)
} else if (type=='median') {
  median(x)
} else {
  var(x)
}


# x <-c(1,3,2,5,2) 
# 조건문을 사용해 x의 원소의 합이 5보다 클 경우, sum(x) is greater 5, 5보다 작을 경우, 'sum(x) is less than 5. 같을 경우, sum(x) is equal to 5를 출력하는 코드 작성
x <-c(1,3,2,5,2)

if (sum(x)>5) {
  cat('sum(x) is greater 5')
} else if (sum(x)<5) {
  cat(sum(x), 'is less than 5.')
} else if (sum(x)==5) {
  cat(sum(x), 'is equal to 5')
}


# 조건문을 사용해, 
#x의 원소 중 3보다 큰 값은 3을 빼서 0-3 사이에 존재하도록 하여
#y 변수에 저장

x <-c(1,3,2,5,2)

if (x>3) {
  y = cat('sum(x) is greater 5')
} else if (sum(x)<5) {
  cat(sum(x), 'is less than 5.')
}

y <- ifelse(x>3, x-3, x)
y

# 3 변수 i를 이용해 i=1, x+y 이고 i=2, x-y이고, i=3, x*y 를 출력하는 구문을
# switch 함수를 이용해 작성하라

x <-c(1,3,2,5,2)
y <- ifelse(x>3, x-3,x)
i <- 3
switch(i, x+y, x-y, x*y)


# 4 score 90 이상이면, A이고 75이상이면 B, 50이상이면 C, 그 외 다른 값은 D를 출력하는 코드 작성

score = 65
if (score>=90){
  cat('A')
} else if (score>=75){
  cat('B')
} else if (score>=50){
  cat('C')
} else {
  cat('D')
}

ifelse(score>=90, 'A',
ifelse(score>=90, 'B',
ifelse(score>=90, 'C','D')))
              
score = 65
# type 변수에 'sqrt', 'square', 'log' 중 하나의 값을 할당할 시
# 해당 변수값에 따라서 'sqrt' 일 때는 score 의 제곱근, 
# square 는 score 의 제곱, log 는 score 의 로그값(log()) 출력하는 코드 작성



type <-'square'
if (type=='sqrt') {
  print(sqrt(score))
} else if (type=='square') {
  print('square')
  print(score**2)
} else if (type=='log') {
  print(log(score))
}

switch(type, sqrt = sqrt(score), square = score**2, log = log(score))


# 

