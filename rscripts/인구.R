install.packages("tidyverse")
install.packages("ggplot2")

library(tidyverse)
library(ggplot2)
library(readxl)

df <- read_excel("./practice/시군구_성_월별_출생_97_21.xlsx")
View(df)

df2 <- df %>% # 원본 df가 아닌 새 변수 df2에 저장
  filter(!is.na(시점)) %>% # 계만 가져옴. na를 제거하지는 않았음. 근데 na는 없는 것만 들고 온거임
  select(시점, 전국) %>%
  separate(시점, into = c("년도", "월")) # -- 원본데이터는 변화시키지 않고 원하는 정보만 추출. 실무에서는 원본데이터 절대 훼손 안 함

df2 <- df2 %>%
  group_by(월) %>%
  summarize(평균출생수 = mean(전국))

df2 %>%
  qplot(x=월, y=평균출생수, data=.) #.이 참조연산자 this.

