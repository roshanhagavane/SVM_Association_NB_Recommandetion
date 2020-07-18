setwd("D:\\ML\\R\\Support Vector Machine")
Salary_Data<-read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/letter-recognition/letter-recognition.data",header = F)
View(Salary_Data)
colnames(Salary_Data)<-c("Salary","x-box","y-box","width","high","onpix","x-bar","y-bar","x2bar","y2bar","xybar","x2ybar","xy2bar","x-ege","xegvy","y-ege","yegvx")
View(Salary_Data)
write.csv(Salary_Data,file="Salary_Data.csv",col.names = F,row.names = F)
# For SVM all the features must be in numeric 
# All the feature values should be in same range 
# If not we should normalize 
# SVM model will perform Rescalling automatically 

# data is randomly arranged 

Salary_Data_Test<-read.csv("D:/Study Material/DataScience/SVM/SalaryData_Test(1).csv")
Salary_Data_Train<-read.csv("D:/Study Material/DataScience/SVM/SalaryData_Train(1).csv")
View(Salary_Data_Test)
View(Salary_Data_Train)
table(Salary_Data$Salary)
Salary_Data$Salary <- as.factor(Salary_Data$Salary)
str(Salary_Data)
Salary_Data_train<-Salary_Data[1:7530,]
Salary_Data_test<-Salary_Data[7530:15060,]
View(Salary_Data)

# to train model
# e1071 package from LIBSVM library
# SVMlight algorithm klar package 


# kvsm() function uses gaussian RBF kernel 

# Building model 

library(kernlab)
library(caret)
#model1<-ksvm(Salary ~.,data = Salary_Data_train,kernel = "vanilladot")

help(kvsm)
??kvsm

# Different types of kernels 
# "rbfdot", "polydot", "tanhdot", "vanilladot", "laplacedot", 
# "besseldot", "anovadot", "splinedot", "matrix"

# kernel = rfdot 
model_rfdot<-ksvm(Salary ~.,data = Salary_Data_train,kernel = "vanilladot")
pred_rfdot<-predict(model_rfdot,newdata=Salary_Data_test)
mean(pred_rfdot==Salary_Data_test$Salary) # 93.075

# kernel = vanilladot
model_vanilla<-ksvm(Salary ~.,data = Salary_Data_train,kernel = "vanilladot")
pred_vanilla<-predict(model_vanilla,newdata=Salary_Data_test)
mean(pred_vanilla==Salary_Data_test$Salary) # 93.075


# kernal = besseldot
model_besseldot<-ksvm(Salary ~.,data = Salary_Data_train,kernel = "besseldot")
pred_bessel<-predict(model_besseldot,newdata=Salary_Data_test)
mean(pred_bessel==Salary_Data_test$Salary)

# kernel = polydot

model_poly<-ksvm(Salary ~.,data = Salary_Data_train,kernel = "polydot")
pred_poly<-predict(model_poly,newdata = Salary_Data_test)
mean(pred_poly==Salary_Data_test$Salary) # 83.925




