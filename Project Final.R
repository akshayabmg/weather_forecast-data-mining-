#Loading the libraries
library(rattle)
rattle()
library(rpart)

#Populating all the data
JCMB_2012 <- read.csv("C:/Users/aksha/Desktop/Data Mining/Project/Dataset/JCMB_2012.csv")
JCMB_2013 <- read.csv("C:/Users/aksha/Desktop/Data Mining/Project/Dataset/JCMB_2013.csv")
JCMB_2014 <- read.csv("C:/Users/aksha/Desktop/Data Mining/Project/Dataset/JCMB_2014.csv")
JCMB_2015 <- read.csv("C:/Users/aksha/Desktop/Data Mining/Project/Dataset/JCMB_2015.csv")
#JCMB_2015 <- read.csv("F:/MS/Course/Books/Pattern Recognition and Data Mining/Project/Data Set/For Submission/JCMB_2015.csv")
#JCMB_2015_OneDay_1 <- read.csv("F:/MS/Course/Books/Pattern Recognition and Data Mining/Project/Data Set/For Submission/JCMB_2015_OneDay_1.csv")
JCMB_2015_OneDay_1 <- read.csv("C:/Users/aksha/Desktop/Data Mining/Project/Dataset/JCMB_2015_OneDay_1.csv")
#Merging the data
complete_data <- rbind(JCMB_2012, JCMB_2013, JCMB_2014) 
write.csv(complete_data, file = "complete_data.csv")
#Populating the complete data and one day data
JCMB_2015_OneDay_1 <- read.csv("JCMB_2015_OneDay_1.csv")
complete_data <- read.csv("complete_data.csv")

#View(JCMB_2015)

###########################################################

##############Rainfall
#Forming the decision tree using rpart
Result_Rainfall<-rpart(formula = rainfall..mm. ~ ., data = crs$dataset[crs$train, c(crs$input, crs$target)], method = "anova", parms = list(split = "information"), control = rpart.control(usesurrogate = 0, maxsurrogate = 0))

#Pruning the tree
library("tree")
set.seed(3)
plot(Result_Rainfall)
summary(Result_Rainfall)
cp_rainfall <- Result_Rainfall$cptable[which.min(Result_Rainfall$cptable[,"xerror"]),"CP"]
Pruned_Tree_rainfall<-prune(Result_Rainfall, cp = cp_rainfall)
fancyRpartPlot(Pruned_Tree_rainfall)
pred_prune_rainfall <- predict(Pruned_Tree_rainfall, JCMB_2015, method="anova")

#Evaluating the test data
Testing_Rainfall <- JCMB_2015[,3]
#RME
RMSE.rainfall_Prune <- sqrt(mean((Testing_Rainfall-pred_prune_rainfall)^2))
RMSE.rainfall_Prune

#MAE
MAE.rainfall_Prune <- mean(abs(Testing_Rainfall-pred_prune_rainfall))
MAE.rainfall_Prune

#MAPE
MAPE.rainfall_Prune <- (mean(abs((Testing_Rainfall-pred_prune_rainfall)/Testing_Rainfall)))*100
MAPE.rainfall_Prune

#For one day rainfall
Testing_Rainfall_1day <- JCMB_2015_OneDay_1[,3]
pred_rainfall_1day <- predict(Result_Rainfall, JCMB_2015_OneDay_1, method="anova")
#Finding the mean of the atmospheric pressure of actual and predicted
mean(pred_rainfall_1day)
mean(Testing_Rainfall_1day)


###################Wind speed
Result_windsp<- rpart(formula = wind.speed..m.s. ~ ., data = crs$dataset[crs$train, c(crs$input, crs$target)], method = "anova", parms = list(split = "information"), control = rpart.control(usesurrogate = 0, maxsurrogate = 0))

#Pruning the tree
set.seed(3)
plot(Result_windsp)
summary(Result_windsp)
cp_windsp <- Result_windsp$cptable[which.min(Result_windsp$cptable[,"xerror"]),"CP"]
Pruned_Tree_windsp<-prune(Result_windsp, cp= cp_windsp)
fancyRpartPlot(Pruned_Tree_windsp)
pred_prune_windsp <- predict(Pruned_Tree_windsp, JCMB_2015, method="anova")

#Evaluating against Test Data
Testing_windsp <- JCMB_2015[,4]
#RME
RMSE.windsp_Prune <- sqrt(mean((Testing_windsp-pred_prune_windsp)^2))
RMSE.windsp_Prune
#MAE
MAE.windsp_Prune <- mean(abs(Testing_windsp-pred_prune_windsp))
MAE.windsp_Prune
#MAPE
MAPE.windsp_Prune <- (mean(abs((Testing_windsp-pred_prune_windsp)/Testing_windsp)))*100
MAPE.windsp_Prune

#For one day Wind Speed
Result_windsp<- rpart(formula = wind.speed..m.s. ~ ., data = crs$dataset[crs$train, c(crs$input, crs$target)], method = "anova", parms = list(split = "information"), control = rpart.control(usesurrogate = 0, maxsurrogate = 0))
Testing_windsp_day1 <- JCMB_2015_OneDay_1[,4] 
pred_windsp_day1 <- predict(Result_windsp, JCMB_2015_OneDay_1, method="anova")
#Finding the mean of the windspeed of actual and predicted
mean(pred_windsp_day1) 
mean(Testing_windsp_day1) 


###########################Atmospheric Pressure
Result_Atm<- rpart(formula = atmospheric.pressure..mBar. ~ ., data = crs$dataset[crs$train, c(crs$input, crs$target)], method = "anova", parms = list(split = "information"), control = rpart.control(cp = 0.0001, usesurrogate = 0, maxsurrogate = 0))

#Pruning the tree
library("tree")
set.seed(3)
plot(Result_Atm)
summary(Result_Atm)
#cv_tree = cv.tree(Result_WindDirection, FUN=prune.rpart)
cp_Atm <- Result_Atm$cptable[which.min(Result_Atm$cptable[,"xerror"]),"CP"]
Pruned_Tree_Atm<-prune(Result_Atm, cp= cp_Atm)
fancyRpartPlot(Pruned_Tree_Atm)
pred_prune_Atm <- predict(Pruned_Tree_Atm, JCMB_2015, method="anova")

#Evaluating against Test Data
Testing_AtmPr <- JCMB_2015[,2]
#RME
RMSE.AtmPr_Prune <- sqrt(mean((Testing_AtmPr-pred_prune_Atm)^2))
RMSE.AtmPr_Prune
#MAE
MAE.AtmPr_Prune <- mean(abs(Testing_AtmPr-pred_prune_Atm))
MAE.AtmPr_Prune
#MAPE
MAPE.AtmPr_Prune <- (mean(abs((Testing_AtmPr-pred_prune_Atm)/Testing_AtmPr)))*100
MAPE.AtmPr_Prune

#For one day Atmospheric Pressure
Testing_AtmPr_day1 <- JCMB_2015_OneDay_1[,2]
pred_AtmPr_day1<- predict(Result_Atm, JCMB_2015_OneDay_1, method="anova")
#Finding the mean of the atmospheric pressure of actual and predicted
mean(pred_AtmPr_day1) 
mean(Testing_AtmPr_day1) 


#################################Relative Humidity
Result_humidity <- rpart(formula = relative.humidity.... ~ ., data = crs$dataset[crs$train,c(crs$input, crs$target)], method = "anova", parms = list(split = "information"), control = rpart.control(minsplit = 40, cp = 0.0001, usesurrogate = 0, maxsurrogate = 0))
fancyRpartPlot(Result_humidity)

#Pruning
library("tree")
set.seed(3)
plot(Result_humidity)
summary(Result_humidity)
cp_humidity<-Result_humidity$cptable[which.min(Result_humidity$cptable[,"xerror"]),"CP"]
Pruned_Tree_Humid<-prune(Result_humidity, cp= cp_humidity)
fancyRpartPlot(Result_humidity)
Pruned_Tree_Humidity <- predict(Pruned_Tree_Humid, JCMB_2015, method="anova")

#Evaluating against Test Data
pred_humidity<- predict(Result_humidity, JCMB_2015, method="anova")
Testing_humidity <- JCMB_2015[,7]
#Finding the mean of the Relative Humidity of actual and predicted
mean(pred_humidity)
mean(Testing_humidity)
#RME
RMSE.humidity<- sqrt(mean((Testing_humidity-pred_humidity)^2))
RMSE.humidity
#MAE
MAE.humidity <- mean(abs(Testing_humidity-pred_humidity))
MAE.humidity
#MAPE
MAPE.humidity <- (mean(abs(Testing_humidity-pred_humidity)/Testing_humidity))*100
MAPE.humidity

#For one day Humidity
Testing_humidity_OneDay <- JCMB_2015_OneDay_1[,7]
pred_Humidity_day1<- predict(Result_humidity, JCMB_2015_OneDay_1, method="anova")
#Finding the mean of the atmospheric pressure of actual and predicted
mean(pred_Humidity_day1) 
mean(Testing_humidity_OneDay) 

#############################################################################
#Finding the Area under the curve (AOC)
library(ROCR)
library(pROC)

#Atmospheric Pressure (0.5123)
roc_pred_Atm <- auc(pred_prune_Atm, Testing_AtmPr)
roc_pred_Atm

#Relative Humidity
roc_Humidity <- auc(pred_humidity, Testing_humidity)
roc_Humidity
