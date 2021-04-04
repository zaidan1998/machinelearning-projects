setwd("C:\Users/aqmal/Desktop/r-experimentt")
> library(vegan)
Loading required package: permute
Loading required package: lattice
This is vegan 2.5-6
> library(dummies)
dummies-1.5.6 provided by Decision Patterns

> library(ada)
Loading required package: rpart
> attr = c('id', 'age', 'exp', 'inc', 'zip', 'family', 
           +          'ccavg', 'edu', 'mortgage', 'loan', 
           +          'securities', 'cd', 'online', 'cc')
> data = read.csv(file = "UniversalBank.csv", 
                  +                 header = TRUE, col.names = attr)
> drop_Attr = c("id", "zip", "exp")
> attr = setdiff(attr, drop_Attr)
> data = data[, attr]
> rm(drop_Attr)
> cat_Attr = c("family", "edu", "securities", 
               +              "cd", "online", "cc", "loan")
> num_Attr = setdiff(attr, cat_Attr)
> rm(attr)
> 
  > cat_Data <- data.frame(sapply(data[,cat_Attr], as.factor))
> num_Data <- data.frame(sapply(data[,num_Attr], as.numeric))
> 
  > data = cbind(num_Data, cat_Data)
> rm(cat_Data, num_Data)
> summary(data)
age             inc        
Min.   :23.00   Min.   :  8.00  
1st Qu.:35.00   1st Qu.: 39.00  
Median :45.00   Median : 64.00  
Mean   :45.34   Mean   : 73.77  
3rd Qu.:55.00   3rd Qu.: 98.00  
Max.   :67.00   Max.   :224.00  
ccavg           mortgage     family  
Min.   : 0.000   Min.   :  0.0   1:1472  
1st Qu.: 0.700   1st Qu.:  0.0   2:1296  
Median : 1.500   Median :  0.0   3:1010  
Mean   : 1.938   Mean   : 56.5   4:1222  
3rd Qu.: 2.500   3rd Qu.:101.0           
Max.   :10.000   Max.   :635.0           
edu      securities cd       online  
1:2096   0:4478     0:4698   0:2016  
2:1403   1: 522     1: 302   1:2984  
3:1501                               



cc       loan    
0:3530   0:4520  
1:1470   1: 480  




> ind_Num_Attr = num_Attr
> rm(num_Attr)
> ind_Cat_Attr = setdiff(cat_Attr, "loan")
> rm(cat_Attr)
> ind_Num_Attr = num_Attr
Error: object 'num_Attr' not found
> rm(num_Attr)
Warning message:
  In rm(num_Attr) : object 'num_Attr' not found
> ind_Cat_Attr = setdiff(cat_Attr, "loan")
Error in as.vector(x) : object 'cat_Attr' not found
> rm(cat_Attr)
Warning message:
  In rm(cat_Attr) : object 'cat_Attr' not found
> ind_Num_Attr = num_Attr
Error: object 'num_Attr' not found
> rm(num_Attr)
Warning message:
  In rm(num_Attr) : object 'num_Attr' not found
> cla_Data = decostand(data[,ind_Num_Attr], "range")
> rm(ind_Num_Attr)
> edu = dummy(data$edu)
Warning message:
  In model.matrix.default(~x - 1, model.frame(~x - 1), contrasts = FALSE) :
  non-list contrasts argument ignored
> family = dummy(data$family)
Warning message:
  In model.matrix.default(~x - 1, model.frame(~x - 1), contrasts = FALSE) :
  non-list contrasts argument ignored
> cla_Data = cbind(cla_Data, edu, family)
> ind_Cat_Attr = setdiff(ind_Cat_Attr, c("edu", "family"))
> rm(edu, family)
> edu = dummy(data$edu)family = dummy(data$family)
Error: unexpected symbol in "edu = dummy(data$edu)family"
> cla_Data = cbind(cla_Data, edu, family)
Error in cbind(cla_Data, edu, family) : object 'edu' not found
> ind_Cat_Attr = setdiff(ind_Cat_Attr, c("edu","family")) rm(edu, family)
Error: unexpected symbol in "ind_Cat_Attr = setdiff(ind_Cat_Attr, c("edu","family")) rm"
> 
  > edu = dummy(data$edu)\
Error: unexpected input in "edu = dummy(data$edu)\"
> edu = dummy(data$edu)
Warning message:
In model.matrix.default(~x - 1, model.frame(~x - 1), contrasts = FALSE) :
  non-list contrasts argument ignored
> edu = dummy(data$edu)
Warning message:
In model.matrix.default(~x - 1, model.frame(~x - 1), contrasts = FALSE) :
  non-list contrasts argument ignored
> family = dummy(data$family)
Warning message:
In model.matrix.default(~x - 1, model.frame(~x - 1), contrasts = FALSE) :
  non-list contrasts argument ignored
> cla_Data = cbind(cla_Data, edu, family)
> ind_Cat_Attr = setdiff(ind_Cat_Attr, c("edu", "family"))
> rm(edu, family)
> cla_Data = cbind(cla_Data, sapply(data[,ind_Cat_Attr], as.numeric))
> rm(ind_Cat_Attr)
> ind_Attr = names(cla_Data)
> cla_Data = cbind(cla_Data, loan=data[,"loan"]) 
> str(cla_Data)
'data.frame':	5000 obs. of  23 variables:
 $ age       : num  0.0455 0.5 0.3636 0.2727 0.2727 ...
 $ inc       : num  0.1898 0.1204 0.0139 0.4259 0.1713 ...
 $ ccavg     : num  0.16 0.15 0.1 0.27 0.1 0.04 0.15 0.03 0.06 0.89 ...
 $ mortgage  : num  0 0 0 0 0 ...
 $ edu1      : int  1 1 1 0 0 0 0 0 0 0 ...
 $ edu2      : int  0 0 0 1 1 1 1 0 1 0 ...
 $ edu3      : int  0 0 0 0 0 0 0 1 0 1 ...
 $ family1   : int  0 0 1 1 0 0 0 1 0 1 ...
 $ family2   : int  0 0 0 0 0 0 1 0 0 0 ...
 $ family3   : int  0 1 0 0 0 0 0 0 1 0 ...
 $ family4   : int  1 0 0 0 1 1 0 0 0 0 ...
 $ edu1      : int  1 1 1 0 0 0 0 0 0 0 ...
 $ edu2      : int  0 0 0 1 1 1 1 0 1 0 ...
 $ edu3      : int  0 0 0 0 0 0 0 1 0 1 ...
 $ family1   : int  0 0 1 1 0 0 0 1 0 1 ...
 $ family2   : int  0 0 0 0 0 0 1 0 0 0 ...
 $ family3   : int  0 1 0 0 0 0 0 0 1 0 ...
 $ family4   : int  1 0 0 0 1 1 0 0 0 0 ...
 $ securities: num  2 2 1 1 1 1 1 1 1 1 ...
 $ cd        : num  1 1 1 1 1 1 1 1 1 1 ...
 $ online    : num  1 1 1 1 1 2 2 1 2 1 ...
 $ cc        : num  1 1 1 1 2 1 1 2 1 1 ...
 $ loan      : Factor w/ 2 levels "0","1": 1 1 1 1 1 1 1 1 1 2 ...
> summary(cla_Data)
      age              inc             ccavg           mortgage            edu1       
 Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.00000   Min.   :0.0000  
 1st Qu.:0.2727   1st Qu.:0.1435   1st Qu.:0.0700   1st Qu.:0.00000   1st Qu.:0.0000  
 Median :0.5000   Median :0.2593   Median :0.1500   Median :0.00000   Median :0.0000  
 Mean   :0.5077   Mean   :0.3045   Mean   :0.1938   Mean   :0.08897   Mean   :0.4192  
 3rd Qu.:0.7273   3rd Qu.:0.4167   3rd Qu.:0.2500   3rd Qu.:0.15906   3rd Qu.:1.0000  
 Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.00000   Max.   :1.0000  
      edu2             edu3           family1          family2          family3         family4      
 Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.000   Min.   :0.0000  
 1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000  
 Median :0.0000   Median :0.0000   Median :0.0000   Median :0.0000   Median :0.000   Median :0.0000  
 Mean   :0.2806   Mean   :0.3002   Mean   :0.2944   Mean   :0.2592   Mean   :0.202   Mean   :0.2444  
 3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:0.000   3rd Qu.:0.0000  
 Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.000   Max.   :1.0000  
      edu1             edu2             edu3           family1          family2          family3     
 Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.000  
 1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.000  
 Median :0.0000   Median :0.0000   Median :0.0000   Median :0.0000   Median :0.0000   Median :0.000  
 Mean   :0.4192   Mean   :0.2806   Mean   :0.3002   Mean   :0.2944   Mean   :0.2592   Mean   :0.202  
 3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:0.000  
 Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.000  
    family4         securities          cd           online            cc        loan    
 Min.   :0.0000   Min.   :1.000   Min.   :1.00   Min.   :1.000   Min.   :1.000   0:4520  
 1st Qu.:0.0000   1st Qu.:1.000   1st Qu.:1.00   1st Qu.:1.000   1st Qu.:1.000   1: 480  
 Median :0.0000   Median :1.000   Median :1.00   Median :2.000   Median :1.000           
 Mean   :0.2444   Mean   :1.104   Mean   :1.06   Mean   :1.597   Mean   :1.294           
 3rd Qu.:0.0000   3rd Qu.:1.000   3rd Qu.:1.00   3rd Qu.:2.000   3rd Qu.:2.000           
 Max.   :1.0000   Max.   :2.000   Max.   :2.00   Max.   :2.000   Max.   :2.000           
> set.seed(123)
> train_RowIDs = sample(1:nrow(cla_Data), nrow(cla_Data)*0.6)
> train_Data = cla_Data[train_RowIDs,]
> test_Data = cla_Data[-train_RowIDs,]
> rm(train_RowIDs)
> model = ada(x = train_Data[,ind_Attr],y = train_Data$loan,iter=20, loss="logistic")
> model
Call:
ada(train_Data[, ind_Attr], y = train_Data$loan, loss = "logistic", 
    iter = 20)

Loss: logistic Method: discrete   Iteration: 20 

Final Confusion Matrix for Data:
          Final Prediction
True value    0    1
         0 2717    5
         1   15  263

Train Error: 0.007 

Out-Of-Bag Error:  0.012  iteration= 20 

Additional Estimates of number of iterations:

train.err1 train.kap1 
        19         19 

> summary(model)
Call:
ada(train_Data[, ind_Attr], y = train_Data$loan, loss = "logistic", 
    iter = 20)

Loss: logistic Method: discrete   Iteration: 20 

Training Results

Accuracy: 0.993 Kappa: 0.96 

> pred_Train  =  predict(model, train_Data[,ind_Attr]) 
> cm_Train = table(train_Data$loan, pred_Train)
> accu_Train= sum(diag(cm_Train))/sum(cm_Train)
> rm(pred_Train, cm_Train)
> pred_Test = predict(model, test_Data[,ind_Attr]) 
> cm_Test = table(test_Data$loan, pred_Test)
> accu_Test= sum(diag(cm_Test))/sum(cm_Test)
> rm(pred_Test, cm_Test)
> accu_Train
[1] 0.9933333
> accu_Test
[1] 0.9855