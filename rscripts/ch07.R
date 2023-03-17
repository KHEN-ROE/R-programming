getwd()

dataset <- read.csv("./data/dataset.csv", header=T) #csv파일 읽는데 헤더는 탭
dataset
print(dataset)
View(dataset)

head(dataset) #앞 6개. 제일 먼저 수집된 데이터일 가능성 높다.
tail(dataset) #뒤 6개. 나중에 수집된 데이터일 수록 데이터질이 높을 가능성 높다

names(dataset) # 컬럼명 나옴 
attributes(dataset)

str(dataset) #자료구조(structure)에서 자료형을 파악하는게 중요

dataset$age
x <- dataset$age #이러면 x의 자료형은 뭐가 됨? 우변의 변수에 의해 결정

plot(dataset$price) #결과 - 다수를 이루는게 평균, 근처는 잔차, 평균에서 크게 벗어나는 값은 아웃라이어.
                            #이 데이터는 정제돼있는 데이터다. 아웃라이어만 제거하면 됨.

dataset[c("job", "price")] # 벡터 말고 리스트라는 단어로 통일

#언어를 너무 많이 배움..
#배열과 리스트의 차이?
#js 에서오브젝트와 map의 차이?
#js와 파이썬 비슷하고 파이썬과 R 비슷함
#R에서 [1:100]는 다 배열이라고 한다.
dataset["gender"] # 딕셔너리 혹은 map인데. 여기서는 딕셔너리(키와 값으로 구성)
dataset[2]
dataset[0]
dataset[1] #R은 인덱스를 1부터 센다... 기억할 것
#딕셔너리는 01234 말고 키값으로 조회한다고 기억할 것

#결측치
#정의되지 않은 값. 무조건 제거한다.

summary(dataset) #결측치 개수 확인

sum(dataset$price, na.rm = T) #결측치 때문에 더할 수 없다. 그래서 na.rm = T 써서 결측치 제거
price2 <- na.omit(dataset$price) #결측치 제거한 데이터 저장
price2

#결측치제거 함수
#1. 있으면 제거
#2. 있으면 보관
 
#결측치 못 지우는 경우? 양이 너무 적을 때. 데이터 5개 중 3개가 결측치일 때. 이럴때 보관. 평균, 중앙값으로 보관. 희석.
#0은 안됨. 평균이 바뀌니까.

#극단치 처리
#아웃라이어 찾으면 제거
#프로젝트할 때는 보관.


