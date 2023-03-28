#선형회귀 예제
#캘리포니아 집 값 데이터
library(tidyverse)
library(reshape2)

 #1. 통계청 누계 출산 데이터 (시계열 ,회귀)
 #2. ~ 집 값 데이터(캘리포니아)=> 대표적인 회귀. 보스턴 집 값은 쓰면 안 됨 why? 데이터 편향 들어가 있음. 흑인 거주 지역~
 #3. 손글씨 분류 => 분류(0~9분류) / iris 분류
 
house <- read.csv("./data/housing.csv")
head(house)

summary(house)

##데이터 시각화(데이터 확인을 위한)
par(mfrow=c(2,5))
colnames(house)

ggplot(data = melt(house), mapping = aes(x=value)) + geom_histogram(bins=30) + facet_wrap(~variable, scales = 'free_x' )



# 결측값 처리
house$mean_bedroom = house$total_bedrooms / house$households
house$mean_rooms = house$total_rooms / house$households

drop = c('total_bedrooms', 'total_rooms')
house = house[ , !(names(house) %in% drop)]
head(house)
str(house) # 문자를 숫자로 바꿔야 함. 리코딩

# 전처리(상식을 사용해서 가정에 대한 데이터를 별도로 분리)
categories = unique(house$ocean_proximity)
categories
cate_house = data.frame(ocean_proximity = house$ocean_proximity)

for(cat in categories){
  cate_house[,cat] = rep(0, times=nrow(cate_house))
}
for(i in 1:length(cate_house$ocean_proximity)){
  cat = as.character(cate_house$ocean_proximity[i])
  cate_house[,cat][i]=1
}

head(cate_house)
