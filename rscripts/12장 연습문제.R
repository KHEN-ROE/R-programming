#12장 연습문제
library(gmodels)
#1
#단계1. 파일가져오기
smoke <- read.csv("./data/smoke.csv", header = T)
head(smoke)
#가독성 좋은 함수가 좋은 함수다.

#단계2. 코딩변경
smoke$education2[smoke$education==1] <- "1. 대졸"
smoke$education2[smoke$education==2] <- "2. 고졸"
smoke$education2[smoke$education==3] <- "3. 중졸"

smoke$smoking2[smoke$smoking==1] <- "1. 과대흡연"
smoke$smoking2[smoke$smoking==2] <- "1. 보통흡연"
smoke$smoking2[smoke$smoking==3] <- "1. 비흡연"

table(smoke$education2, smoke$smoking2)

CrossTable(smoke$education2, smoke$smoking2, chisq = T)
#해석 - p 값이 0.05 보다 낮으므로 유의미하다. 귀무가설 기각하고 대립가설 채택 가능

#2. 
data <- read.csv("./data/cleanData.csv", fileEncoding = "euc-kr") #euc-kr, cp949, ko-KR(euc-kr) -> euc-KR
str(data)

x <- data$position
y <- data$age3
plot(x,y, abline(lm(y~x))) #추세선
CrossTable(x,y, chisq = T) #p가 -값임. 즉 자명하다는 의미. 그러나 자유도가 8이다. 경향성은 맞으나 콕 찝어서 너는? 이라고하면 경향성에서 벗어난다.
                            #ex) top100에 있는 노래 누구나 듣지만 특정 한 명 찝어서 물어보면 경향성에서 벗어날 수 있다(자유도 높을 수록)

#3.
result <- read.csv("./data/response.csv")
str(result)

result$job2[result$job==1] <- "1. 학생"
result$job2[result$job==2] <- "2. 직장인"
result$job2[result$job==3] <- "3. 주부"
result$response2[result$response==1] <- "1.무응답"
result$response2[result$response==2] <- "2.낮음"
result$response2[result$response==3] <- "3.높음"

table(result$job2, result$response2)
chisq.test(result$job2, result$response2)
