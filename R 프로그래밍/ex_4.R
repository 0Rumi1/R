# 저장한 데이터 불러오기

savePath = ('C:/Users/USER/Documents/R/2010_1%_인구사항_20230214_48383.RData')
load(savePath)
str(popData)


# 컬럼의 값 그래프 >> table(데이터)
table(popData$V1)
table(popData$V3)


# 범주형 데이터 빈도 표현 >> 막대그래프
barplot(table(popData$V1), col = 'red')

