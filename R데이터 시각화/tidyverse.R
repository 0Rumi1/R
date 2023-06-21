# 시각화 관련 패키지
# ggplot, tidyverse


install.packages('tidyverse')
library('tidyverse')

if(!require("tidyverse")){
  install.packages('tidyverse')
  library(tidyverse)
}

install.packages('ggplot2')
library('ggplot2')
# -------------------------------------------------------------------------
# 시각화 실습 
# -------------------------------------------------------------------------
# 내장 데이터셋 mpg
str(mpg)
mpg

colnames(mpg)
# mpg 데이터 시각화 => 그래프
# ggplot(): plot 객체 초기화
# geom_point)): 데이터 표시해주는 ㅎ마수
#               x, y 좌표 설정
#               color 포인트 색상
#               size 포인트 크기
#               alpha 포인트 투명도

ggplot(data = mpg) + 
geom_point(mapping = aes(x=displ, y=hwy, color=class, 
                         size=class, alpha=0.7))


# 제공되는 색상
head(colors())
colors()[1:10]


# 화면분할 후 그래프 출력
ggplot(data = mpg) +
geom_point(mapping = aes(x=displ, y=hwy))
+facet_wrap(~class, nrow=2)

#ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) +
#  geom_point(mapping = aes(color=class)) + 
#  geom_smooth(
#    data = filter(mpg, class =='subcompact'),
#    se = FALSE)
                                                                                                  

geom_bar(data=mpg)

ggplot(data = mpg, mapping = aes(x=class, y=hwy))+
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x=class, y=hwy))+
  geom_boxplot() +
  coord_flip()  # 수평 박스 플롯으로 변경, flip

diamonds


















