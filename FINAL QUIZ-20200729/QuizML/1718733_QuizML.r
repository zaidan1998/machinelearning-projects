AdvWorksCusts <- read.csv("C:/Users/user/Desktop/ACADEMIC/DEGREE/YEAR 3/SEM 2/MACHINE LEARNING/FINAL QUIZ-20200729/AdvWorksCusts.csv", header=FALSE)
>   View(AdvWorksCusts)
> AW_BikeBuyer <- read.csv("C:/Users/user/Desktop/ACADEMIC/DEGREE/YEAR 3/SEM 2/MACHINE LEARNING/FINAL QUIZ-20200729/AW_BikeBuyer.csv")
>   View(AW_BikeBuyer)
> AW_test <- read.csv("C:/Users/user/Desktop/ACADEMIC/DEGREE/YEAR 3/SEM 2/MACHINE LEARNING/FINAL QUIZ-20200729/AW_test.csv", header=FALSE)
>   View(AW_test)
  > df = subset(AdvWorksCusts, select = -c(V2,V4,V6,V8) )
  > View(AW_test)
  > df3 = subset(AW_test, select = -c(V2,V4,V6,V8) )
  > library(dplyr)
  > df=unique(df)
  > View(df)
  > df=distinct(df,V1, .keep_all= TRUE)
  > df2=unique(AW_BikeBuyer)
  > View(df2)
  > df2=distinct(df2,CustomerID, .keep_all= TRUE)
  > df3=unique(df3)
  > View(df3)
  > df3=distinct(df3,V1, .keep_all= TRUE)
  > summary(df)
  V1                 V3           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V5                 V7           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V9                V10           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V11                V12           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V13                V14           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V15                V16           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V17                V18           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V19                V20           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V21                V22           
  Length:16405       Length:16405      
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V23           
  Length:16405      
  Class :character  
  Mode  :character
  > summary(df2)
  CustomerID      BikeBuyer     
  Min.   :11000   Min.   :0.0000  
  1st Qu.:15618   1st Qu.:0.0000  
  Median :20232   Median :0.0000  
  Mean   :20240   Mean   :0.3323  
  3rd Qu.:24862   3rd Qu.:1.0000  
  Max.   :29482   Max.   :1.0000
  > summary(df3)
  V1                 V3           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V5                 V7           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V9                V10           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V11                V12           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V13                V14           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V15                V16           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V17                V18           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V19                V20           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V21                V22           
  Length:501         Length:501        
  Class :character   Class :character  
  Mode  :character   Mode  :character  
  V23           
  Length:501        
  Class :character  
  Mode  :character
  > hist(df2$BikeBuyer)
  > df=df[-c(1), ]
  > View(df)
  > View(df3)
  > df3=df3[-c(1), ]
  > View(df3)
  > plot(df2$BikeBuyer)
  barplot(df2$BikeBuyer)
  > boxplot(df2$BikeBuyer)
  > pie(table(df2$BikeBuyer))
  