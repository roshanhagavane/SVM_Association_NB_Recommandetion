setwd("D:/Study Material/DataScience/SVM")
Forest_Fires<-read.csv("D:/Study Material/DataScience/SVM/forestfires.csv")
View(Forest_Fires)
Forest_Fires <-Forest_Fires[,c(3,4,5,6,7,8,9,10,31)]
View(Forest_Fires)
write.csv(Forest_Fires,file="Forest_Fires.csv",col.names = F,row.names = F)
# For SVM all the features must be in numeric 
# All the feature values should be in same range 
# If not we should normalize 
# SVM model will perform Rescalling automatically 

# data is randomly arranged 

Forest_Fires_Test<-read.csv("D:/Study Material/DataScience/SVM/forestfires.csv")
Forest_Fires_Train<-read.csv("D:/Study Material/DataScience/SVM/forestfires.csv")
View(Forest_Fires_Test)
View(Forest_Fires_Train)
table(Forest_Fires$size_category)
Forest_Fires$size_category <- as.factor(Forest_Fires$size_category)
str(Forest_Fires)
Forest_Fires_train<-Forest_Fires[1:260,]
Forest_Fires_test<-Forest_Fires[261:517,]
View(Forest_Fires)

# to train model
# e1071 package from LIBSVM library
# SVMlight algorithm klar package 


# kvsm() function uses gaussian RBF kernel 

# Building model 

library(kernlab)
library(caret)
#model1<-ksvm(size_category ~.,data = Forest_Fires_train,kernel = "vanilladot")

help(kvsm)
??kvsm

# Different types of kernels 
# "rbfdot", "polydot", "tanhdot", "vanilladot", "laplacedot", 
# "besseldot", "anovadot", "splinedot", "matrix"

# kernel = rfdot 
model_rfdot<-ksvm(size_category ~.,data = Forest_Fires_train,kernel = "vanilladot")
pred_rfdot<-predict(model_rfdot,newdata=Forest_Fires_test)
mean(pred_rfdot==Forest_Fires_test$size_category) # 93.075

# kernel = vanilladot
model_vanilla<-ksvm(size_category ~.,data = Forest_Fires_train,kernel = "vanilladot")
pred_vanilla<-predict(model_vanilla,newdata=Forest_Fires_test)
mean(pred_vanilla==Forest_Fires_test$size_category) # 93.075


# kernal = besseldot
model_besseldot<-ksvm(size_category ~.,data = Forest_Fires_train,kernel = "besseldot")
pred_bessel<-predict(model_besseldot,newdata=Forest_Fires_test)
mean(pred_bessel==Forest_Fires_test$size_category)

# kernel = polydot

model_poly<-ksvm(size_category ~.,data = Forest_Fires_train,kernel = "polydot")

pred_poly<-predict(model_poly,newdata = Forest_Fires_test)
mean(pred_poly==Forest_Fires_test$size_category) # 83.925




