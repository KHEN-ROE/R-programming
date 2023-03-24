#7장 연습문제

# 2. dataset2의 resident 칼럼을 대상으로 NA값 제거 후 resident2 변수에 저장
#풀이
getwd()
dataset <- read.csv("./data/dataset.csv", header = T) #db에 넣을 때 header 추가해줘야함 
dataset
head(dataset)
dataset2 <- subset(dataset, price >= 2 & price <=8) #subset(데이터셋, 조건) subset 은 부분집합
str(dataset2)
pos <- dataset2$position
pos
cpos <- 6 - pos #결과는 벡터로 나온다. # 6빼는 이유? 읽기 힘들어서. 6 - 2 = 4. 4등급이라는 의미. # 효율 높여줌
cpos

dataset2$position <- cpos
dataset2$position[dataset2$position == 1] <- '1급'
dataset2$position[dataset2$position == 2] <- '2급'
dataset2$position[dataset2$position == 3] <- '3급'
dataset2$position[dataset2$position == 4] <- '4급'
dataset2$position[dataset2$position == 5] <- '5급'

range(dataset2$resident, na.rm = T)
dataset2 <- subset(dataset2, !is.na(dataset2$resident))
head(dataset2)


View(dataset2)

#내가 짠거
str(dataset2)
summary(dataset2)
resident2 <- na.omit(dataset2$resident)
resident2
sum(resident2)

# 3. dataset2의 gender 컬럼을 대상으로 1->"남자", 2->"여자"로 코딩 변경하여 gender2 컬럼에 추가하고, 파이 차트로 결과 확인
dataset2$gender2[dataset2$gender == 1] <- "남자"
dataset2$gender2[dataset2$gender == 2] <- "여자"

#코딩변경 전과 후 비교
dataset2[c("gender", "gender2")]
#파이차트로 결과 확인
pie(table(dataset2$gender2))


# 4. dataset2의 age 컬럼을 대상으로 30세 이하->1, 30~55세->2, 55이상->3 으로 리코딩하여 age3 컬럼에 추가한 뒤 age,age2,age3컬럼만 확인
dataset2$age3[dataset2$age <= 30] <- 1
dataset2$age3[dataset2$age >= 30 & dataset2$age <= 55 ] <- 2
dataset2$age3[dataset2$age >= 55] <- 3

head(dataset2[c('age','age2','age3')])


#8장 연습문제
# 1. 다음 조건에 맞게 quakes 데이터 셋의 수심(depth)과 리히터 규모(mag)가 동일한 패널에 지진의 발생지를 산점도로 시각화 하시오
#조건 1. 수심을 3개 영역으로 범주화
#조건 2. 리히터 규모를 2개 영역으로 범주화
#조건 3. 수심과 리히터 규모를 3행 2열 구조의 패널로 산점도 그래프 그리기
#(힌트 : lattice 패키지의 equal.count()와 xyplot()함수 이용 )
install.packages("lattice")
library(lattice)
?quakes
??equal.count #해당 함수 속해있는 패키지 찾아줌
data(quakes)
summary(quakes)
str(quakes)
#범주화
depthgroup <- equal.count(quakes$depth, number=3, overlap=0) #3분위로 범주화
depthgroup

magnitudegroup <- equal.count(quakes$mag, number=2, overlap=0)
magnitudegroup

#산점도 그래프
xyplot(lat ~ long | depthgroup * magnitudegroup, data = quakes, main="Fiji Earthquakes", ylab="latitude", xlab="longitude", pch="@", col=c("red","blue"))

# 2. latticeExtra 패키지에서 제공되는 SeatacWeather 데이터 셋에서 월별로 최저기온과 최고기온을 선 그래프로 플로팅하시오
# 힌트 : lattice 패키지의 xyplot() 함수 이용
# 힌트 : 선 그래프 : type="l"
install.packages("latticeExtra")
#데이터셋 목록 확인
Package_Data_List <- data(package = .packages(all.available = TRUE))
Package_Data_List
library(latticeExtra)
summary(SeatacWeather)
xyplot(min.temp + max.temp ~ day | month, 
       data = SeatacWeather, type="l")  

