

library(dplyr)
library(tidyr)
library(ggplot2)
library(vioplot)
library(corrplot)
library(gmodels)
library(matrixStats)

install.packages('tidyr')

state <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/state.csv')
airline_stats <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/airline_stats.csv', stringsAsFactors = FALSE)
airline_stats$airline <- ordered(airline_stats$airline, levels=c('Alaska', 'American', 'Jet Blue', 'Delta', 'United', 'Southwest'))
dfw <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/dfw_airline.csv', stringsAsFactors = FALSE)
sp500_sym <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/sp500_sym.csv')
sp500_px <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/sp500_px.csv')
kc_tax <-read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/kc_tax.csv')
lc_loan <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/lc_loans.csv')
loans_income <- read.csv('C:/Users/USER/Documents/R/AAA - Practical Statistics/loans_income.csv', stringsAsFactors = FALSE)

sp500_px
colnames(sp500_sym)

# 평균
mean(state[["Population"]])
# 절사평균
mean(state[["Population"]], trim=0.1) # 각 끝에서 10% 제외
# 중간값
median(state[["Population"]])

# 평균이 절사평균보다 크고, 절사평균은 중간값보다 크다.
# 절사평균 



airline_stats$airline
state_asc <- state
state_asc[['Population']] <- formatC(state_asc[['Population']], format='d', digits=0, big.mark=',')
state_asc[1:8,]


# 표준편차 - 특이값에 민감
sd(state[['Population']])
# 사분위범위
IQR(state[['Population']])
# 중위절대편차
mad((state[['Population']]))

quantile(state[['Murder.Rate']], p=c(.05, .25, .5, .75, .95))

# 중간값은 10만 명당 4건의 살인


boxplot(state[['Population']]/1000000, ylab='Population(millions)')

# 도수분포표와 히스토그램 
breaks <- seq(from=min(state[['Population']]),
              to=max(state[['Population']]), length=11)

pop_freq <- cut(state[['Population']], breaks=breaks,
                right=TRUE, include.lowest = TRUE)

table(pop_freq)

hist(state[['Population']], breaks=breaks)

# 밀도추정
hist(state[['Murder.Rate']], freq=FALSE)
lines(density(state[['Murder.Rate']]), lwd=3, col='blue')


barplot(as.matrix(dfw)/6, cex.axis = .5)

etfs <-sp500_px[row.names(sp500_px)>'2012-07-01',
                sp500_sym[sp500_sym$sector == 'etf', 'symbol']]
etfs


# 상관계수 - 데이터의 특이값에 민감
library(corrplot)
corrplot(cor(etfs), method = 'ellipse')

#산점도
telecom <- sp500_px[, sp500_sym[sp500_sym$sector == 'telecommunications_services', 'symbol']]
telecom <- telecom[row.names(telecom) > '2012-07-01',]
telecom_cor <- cor(telecom)
telecom


plot(telecom$T, telecom$VZ, xlab="T", ylab = 'VZ')
abline(h=0, v=0, col='grey')
dim(telecom)


# 산점도 데이터의 개수가 상대적으로 적을때는 괜찮다. 
# 수십, 수백만 레코드는 너무 밀집되어 알아보기 힘들다. 
# 데이터의 주요 부분에 집중하기 위해, 아주 비싸거나, 너무 작은 혹은 너무 큰 주택들은 subset 함수를 이용해 제거
kc_tax0 <- subset(kc_tax, TaxAssessedValue < 750000 &
                    SqFtTotLiving > 100 &
                    SqFtTotLiving<3500)
nrow(kc_tax0)

# 육각형 구간 도표
library(ggplot2)
ggplot(kc_tax0, (aes(x=SqFtTotLiving, y=TaxAssessedValue))) + 
  stat_binhex(colour='white') + 
  theme_bw() +
  scale_fill_gradient(low='white', high='purple') +
  labs(x='finished squrare feet', y='tax assessed value')

# 등고선
ggplot(kc_tax0, aes(SqFtTotLiving, TaxAssessedValue)) +
  theme_bw() +
  geom_point(alpha=0.1)+
  geom_density2d(colour='white') +
  labs(x='finished square feet', y='tax assessed value')


install.packages('descr')
library(descr)
x_tab <- CrossTable(lc_loans$grade, lc_loans$status,
                    prop.c=FALSE, prop.chisq = FALSE, prop.t = FALSE)

x_tab


boxplot(pct_carrier_delay ~ airline, data=airline_stats, ylim=c(0,50))


ggplot(data=airline_stats, aes(airline, pct_carrier_delay)) +
  ylim(0,50) +
  geom_vilin() +
  labs(x="", y = "Daily%of Delayed Flights")


ggplot(data=airline_stats, aes(airline, pct_carrier_delay)) +
  ylim(0,50) +
  geom_violin() +
  geom_boxplot() +
  labs(x="", y="Daily % of Delayed Flights")



#
install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)

# zip_code 확인하기
kc_tax

# Zipcode => int가 아닌 chr 타입으로 변환
kc_tax_zip <- as.character(kc_tax$ZipCode)
class(kc_tax_zip)

colnames(kc_tax)

mean(kc_tax$TaxAssessedValue, na.rm=T)


kc_tax_zipcode = kc_tax %>%
  group_by(ZipCode) %>%
  summarize(tax_mean = mean(TaxAssessedValue , na.rm=T))

kc_tax_zipcode

head(arrange(kc_tax_zipcode, tax_mean))

arrange(kc_tax_zipcode, desc(tax_mean))

#사분위로 구분한 후, 75% 이상 범위로 필터링
quantile(kc_tax_zipcode[['tax_mean']], p=c(.05, .25, .5, .75, .95), , na.rm=T)


library(dplyr)


#filter(kc_tax_zip, tax_mean >= 552777)

# 다변수 시각화하기
# 우편번호에서의 평가액이 다른 두 군데보다 훨씬 높음

ggplot(subset(kc_tax0, ZipCode %in% c(98188,98105,98108,98126)),
       aes(x=SqFtTotLiving, y=TaxAssessedValue)) +
  stat_binhex(colour='white') +
  theme_bw() +
  scale_fill_gradient(low='white', high='blue') +
  labs(x='Finished Square Feet', y='Tax Assessed Value') +
  facet_wrap('ZipCode')

library(boot)
library(ggplot2)

loans_income <- loans_income[, 1]
sp500_px <- read.csv('sp500_data.csv', row.names=1)
samp_data <- data.frame(income=sample(loans_income[['x']], 1000),
                        type = 'data_dist')

samp_mean_05 <- data.frame(income = tapply(sample(loans_income[["x"]],1000*5),rep(1:1000,rep(5,1000))
                                           ,FUN=mean),type="mean_of_5")

samp_mean_20 <- data.frame(income=tapply(sample(loans_income[["x"]],1000*20),rep(1:1000,rep(20,1000)),FUN=mean),
                           type="mean_of_20")


head(loans_income)

length(loans_income)
dim(loans_income)


income <- rbind(samp_data,samp_mean_05,samp_mean_20)

income$type=factor(income$type,levels=c("data_dist","mean_of_5","mean_of_20"),labels=c("Data","Mean of 5","Mean of 20"))
ggplot(data=income,mapping=aes(x=income))+
  geom_histogram(bins=40)+
  facet_grid(.~type)

stat_fun <- function(x, idx){
  median(x[idx])
}

boot_obj <- boot(loans_income[["x"]],R=1000,statistic = stat_fun)
boot_obj


# 표준정규분포를 따르는 100개의 자료 추출하는 함수
norm_samp <- rnorm(100)

# qq 그림
qqnorm(norm_samp)

# a는 intercept, b는 slope
abline(a=0,b=1,col="grey")


# 데이터 불러오기 및 가공
sp500 <- read.csv("sp500_data.csv")
nflx <- sp500[,"NFLX"]
nflx <- diff(log(nflx[nflx>0]))




















