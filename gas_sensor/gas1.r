options("width"=200);

#Import preprocessed gas sensor array drift data set using space as the separator
gasdata = read.table(paste(Sys.getenv("HOME"),"/mr/preprocess/allbatches.dat",sep=""),header=F);

df = transform(gasdata,GAS=as.factor(gasdata$V1), CONC=gasdata$V2,
       #sensor 1               
       S1DR = gasdata$V3, S1NDR = gasdata$V4, S1I_001 = gasdata$V5, S1I_01 = gasdata$V6, 
       S1I_1 = gasdata$V7, S1D_001 = gasdata$V8, S1D_01 = gasdata$V9, S1D_1 = gasdata$V10,

       #sensor 2
       S2DR = gasdata$V11, S2NDR = gasdata$V12, S2I_001 = gasdata$V13, S2I_01 = gasdata$V14, 
       S2I_1 = gasdata$V15, S2D_001 = gasdata$V16, S2D_01 = gasdata$V17, S2D_1 = gasdata$V18,

       #sensor 3
       S3DR = gasdata$V19, S3NDR = gasdata$V20, S3I_001 = gasdata$V21, S3I_01 = gasdata$V22, 
       S3I_1 = gasdata$V23, S3D_001 = gasdata$V24, S3D_01 = gasdata$V25, S3D_1 = gasdata$V26,
       
       #sensor 4               
       S4DR = gasdata$V27, S4NDR = gasdata$V28, S4I_001 = gasdata$V29, S4I_01 = gasdata$V30, 
       S4I_1 = gasdata$V31, S4D_001 = gasdata$V32, S4D_01 = gasdata$V33, S4D_1 = gasdata$V34,
       
       #sensor 5
       S5DR = gasdata$V35, S5NDR = gasdata$V36, S5I_001 = gasdata$V37, S5I_01 = gasdata$V38, 
       S5I_1 = gasdata$V39, S5D_001 = gasdata$V40, S5D_01 = gasdata$V41, S5D_1 = gasdata$V42,
       
       #sensor 6
       S6DR = gasdata$V43, S6NDR = gasdata$V44, S6I_001 = gasdata$V45, S6I_01 = gasdata$V46, 
       S6I_1 = gasdata$V47, S6D_001 = gasdata$V48, S6D_01 = gasdata$V49, S6D_1 = gasdata$V50,
       
       #sensor 7               
       S7DR = gasdata$V51, S7NDR = gasdata$V52, S7I_001 = gasdata$V53, S7I_01 = gasdata$V54, 
       S7I_1 = gasdata$V55, S7D_001 = gasdata$V56, S7D_01 = gasdata$V57, S7D_1 = gasdata$V58,
       
       #sensor 8
       S8DR = gasdata$V59, S8NDR = gasdata$V60, S8I_001 = gasdata$V61, S8I_01 = gasdata$V62, 
       S8I_1 = gasdata$V63, S8D_001 = gasdata$V64, S8D_01 = gasdata$V65, S8D_1 = gasdata$V66,
       
       #sensor 9
       S9DR = gasdata$V67, S9NDR = gasdata$V68, S9I_001 = gasdata$V69, S9I_01 = gasdata$V70, 
       S9I_1 = gasdata$V71, S9D_001 = gasdata$V72, S9D_01 = gasdata$V73, S9D_1 = gasdata$V74,
       
       #sensor 10               
       S10DR = gasdata$V75, S10NDR = gasdata$V76, S10I_001 = gasdata$V77, S10I_01 = gasdata$V78, 
       S10I_1 = gasdata$V79, S10D_001 = gasdata$V80, S10D_01 = gasdata$V81, S10D_1 = gasdata$V82,
       
       #sensor 11
       S11DR = gasdata$V83, S11NDR = gasdata$V84, S11I_001 = gasdata$V85, S11I_01 = gasdata$V86, 
       S11I_1 = gasdata$V87, S11D_001 = gasdata$V88, S11D_01 = gasdata$V89, S11D_1 = gasdata$V90,
       
       #sensor 12
       S12DR = gasdata$V91, S12NDR = gasdata$V92, S12I_001 = gasdata$V93, S12I_01 = gasdata$V94, 
       S12I_1 = gasdata$V95, S12D_001 = gasdata$V96, S12D_01 = gasdata$V97, S12D_1 = gasdata$V98,

       #sensor 13
       S13DR = gasdata$V99, S13NDR = gasdata$V100, S13I_001 = gasdata$V101, S13I_01 = gasdata$V102, 
       S13I_1 = gasdata$V103, S13D_001 = gasdata$V104, S13D_01 = gasdata$V105, S13D_1 = gasdata$V106,
       
       #sensor 14               
       S14DR = gasdata$V107, S14NDR = gasdata$V108, S14I_001 = gasdata$V109, S14I_01 = gasdata$V110, 
       S14I_1 = gasdata$V111, S14D_001 = gasdata$V112, S14D_01 = gasdata$V113, S14D_1 = gasdata$V114,
       
       #sensor 15
       S15DR = gasdata$V115, S15NDR = gasdata$V116, S15I_001 = gasdata$V117, S15I_01 = gasdata$V118, 
       S15I_1 = gasdata$V119, S15D_001 = gasdata$V120, S15D_01 = gasdata$V121, S15D_1 = gasdata$V122,
       
       #sensor 16
       S16DR = gasdata$V123, S16NDR = gasdata$V124, S16I_001 = gasdata$V125, S16I_01 = gasdata$V126, 
       S16I_1 = gasdata$V127, S16D_001 = gasdata$V128, S16D_01 = gasdata$V129, S16D_1 = gasdata$V130,
       
       BATCH = as.factor(gasdata$V131)
       
);              

#Now that we have clean data, discard original columns containing feature number as the prefix.
df = subset(df, select = -c(V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,
                            V11,V12,V13,V14,V15,V16,V17,V18,V19,V20,
                            V21,V22,V23,V24,V25,V26,V27,V28,V29,V30,
                            V31,V32,V33,V34,V35,V36,V37,V38,V39,V40,
                            V41,V42,V43,V44,V45,V46,V47,V48,V49,V50,
                            V51,V52,V53,V54,V55,V56,V57,V58,V59,V60,
                            V61,V62,V63,V64,V65,V66,V67,V68,V69,V70,
                            V71,V72,V73,V74,V75,V76,V77,V78,V79,V80,
                            V81,V82,V83,V84,V85,V86,V87,V88,V89,V90,
                            V91,V92,V93,V94,V95,V96,V97,V98,V99,V100,
                            V101,V102,V103,V104,V105,V106,V107,V108,V109,V110,
                            V111,V112,V113,V114,V115,V116,V117,V118,V119,V120,
                            V121,V122,V123,V124,V125,V126,V127,V128,V129,V130,V131
                            
) );

gasdata <- NULL;

calculateTestError <- function(predictedClass,trueClass) {
  tab <- table(predictedClass,trueClass);
  return (1-sum(diag(tab))/sum(tab));
}

#Decision Tree
library(rpart);
require(ggplot2);
library(rpart.plot);
library(rattle);
library(RColorBrewer);

#Decision tree (entropy split) using rpart package
entropy.dt <- rpart(GAS ~ . - GAS, data=df.train, method="class",parms=list(split="information"));
entropy.dt;
printcp(entropy.dt);
plotcp(entropy.dt);
plot(entropy.dt, uniform=TRUE);
text(entropy.dt, cex=.8);
#Find dimensions
par("usr");
legend(0.4,0.30, c("1 Ethanol","2 Ethylene","3 Ammonia","4 Acetaldehyde","5 Acetone","6 Toluene"), cex=0.8);
# Prune the tree 
entropy.pdt<- prune(entropy.dt, cp= entropy.dt$cptable[which.min(entropy.dt$cptable[,"xerror"]),"CP"]);
plot(entropy.pdt, uniform=TRUE, main="Pruned Classification Tree (Entropy Split)");
text(entropy.pdt, cex=.8);
legend(0.4,0.35, c("1 Ethanol","2 Ethylene","3 Ammonia","4 Acetaldehyde","5 Acetone","6 Toluene"), cex=0.8);

#Predict
entropy.pred = predict(entropy.pdt,df.test,type="class");
#Find test error
calculateTestError(entropy.pred,test.class);

#Do 10 fold cross validation using entropy tree
#split data into training and test (80% training and 20% test)
set.seed(6721);
k = 1;
enrtopy.cv.error.arr= rep (0,k);
for (i in 1:k) {
  train.idx <-sample(nrow(df), floor(nrow(df)*0.8), replace=FALSE);
  df.train <- df[train.idx, ];
  df.test <- df[-train.idx,];
  test.class <- df.test$GAS;
  entropy.dt <- rpart(GAS ~ . - GAS, data=df.train, method="class",parms=list(split="information"));
  entropy.pred = predict(entropy.dt,df.test,type="class");
  enrtopy.cv.error.arr[i] = calculateTestError(entropy.pred,test.class);
}
enrtopy.cv.error.arr;
enrtopy.cv.error = mean(enrtopy.cv.error.arr);
enrtopy.cv.error;

#Do cross validation using gini split
set.seed(7412);
k = 1;
gini.cv.error.arr = rep (0,k);
for (i in 1:k) {
  train.idx <-sample(nrow(df), floor(nrow(df)*0.8), replace=FALSE);
  df.train <- df[train.idx, ];
  df.test <- df[-train.idx,];
  test.class <- df.test$GAS;
  gini.dt <- rpart(GAS ~ . - GAS, data=df.train, method="class",parms=list(split="gini"));
  gini.pred = predict(gini.dt,df.test,type="class");
  gini.cv.error.arr[i] = calculateTestError(gini.pred,test.class);
}
gini.cv.error.arr;
gini.cv.error = mean(gini.cv.error.arr);
gini.cv.error;

#Decision tree (gini split) using rpart package
gini.dt <- rpart(GAS ~ . - GAS, data=df.train, method="class",parms=list(split="gini"));
gini.dt;
printcp(gini.dt);
plotcp(gini.dt);
plot(gini.dt, uniform=TRUE, main="Classification Tree (Gini Split)");
text(gini.dt, cex=.8);
#Find dimensions
par("usr");
legend(0.4,0.35, c("1 Ethanol","2 Ethylene","3 Ammonia","4 Acetaldehyde","5 Acetone","6 Toluene"), cex=0.8);
# Prune the tree 
gini.pdt<- prune(gini.dt, cp= gini.dt$cptable[which.min(gini.dt$cptable[,"xerror"]),"CP"]);
plot(gini.pdt, uniform=TRUE, main="Pruned Classification Tree (Gini Split)");
text(gini.pdt, cex=.8);
legend(0.4,0.35, c("1 Ethanol","2 Ethylene","3 Ammonia","4 Acetaldehyde","5 Acetone","6 Toluene"), cex=0.8);

#Predict
gini.pred = predict(gini.pdt,df.test,type="class");
#Find test error
calculateTestError(gini.pred,test.class);

#Keep borders to a minimum
par(mar=c(3,3,3,3));

#Set outer margin
par(oma=c(3,3,4,3));

#Decision tree using tree library
library(tree);
tree.df = tree(GAS ~ . - GAS, data=df.train);
summary(tree.df);
plot(tree.df, main="Classification Tree");
title(main="Classification Tree");
text(tree.df, cex=.8);
legend("bottomleft", c("1 Ethanol","2 Ethylene","3 Ammonia","4 Acetaldehyde","5 Acetone","6 Toluene"), cex=0.8);

#Predict and compute error
tree.df.pred = predict(tree.df,df.test,type="class");
calculateTestError(tree.df.pred,test.class);

#Do cross validation
cv.tree.df = cv.tree(tree.df,FUN=prune.misclass); 
cv.tree.df;
plot(cv.tree.df);
title(main="Effect of Tree Size on Missclassification",xlab="sadf")
text(cv.tree.df, cex=.8);

#Plots
#par(mfrow=c(1,2));
#plot(cv.tree.df$size,cv.tree.df$dev,type="b");
#plot(cv.tree.df$k,cv.tree.df$dev,type="b");


#Prune the tree based on cv results
prune.tree.df = prune.misclass(tree.df,best=20);
prune.tree.df.pred = predict(prune.tree.df,df.test,type="class");
calculateTestError(prune.tree.df.pred,test.class);

#Bagged trees on taining set
library(randomForest);
bag.df = randomForest(GAS ~ . - GAS, data=df.train, mtry = 130, importance=TRUE);
bag.df.pred = predict(bag.df,df.test,type="class");
calculateTestError(bag.df.pred,test.class);
plot(bag.df);

#Bagged trees on full set
library(randomForest);
bag.df.full = randomForest(GAS ~ . - GAS, data=df, mtry = 130, importance=TRUE);
bag.df.full;
plot(bag.df.full, main=NULL, log="y");
legend("topright", c('OOB','Ethanol','Ethylene','Ammonia','Acetaldehyde','Acetone','Toluene'),col=1:6,cex=0.8,fill=1:6);
legend("topright", colnames(bag.df.full$err.rate),col=1:7);
#legend("topright", c('OOB','Ethanol','Ethylene','Ammonia','Acetaldehyde','Acetone','Toluene'),col=1:7,cex=0.8,fill=1:7);
varImpPlot(bag.df.full, main=NULL);

#Random forest
library(randomForest);
forest.df = randomForest(GAS ~ . - GAS, data=df.train, mtry = 12, importance=TRUE);
forest.df.pred = predict(forest.df,df.test,type="class");
calculateTestError(forest.df.pred,test.class);
plot(forest.df,main=NULL, log="y");
legend("topright", c('OOB','Ethanol','Ethylene','Ammonia','Acetaldehyde','Acetone','Toluene'),col=1:6,cex=0.8,fill=1:6);
forest.df;
table(forest.df.pred,test.class,dnn=c("Predicted Class","Observed Class"));

#Boosting using gbm (does not work)
library(gbm);
boost.df = gbm(GAS ~ . - GAS, data=df.train, distribution="multinomial", n.tree = 5000, interaction.depth=4);
boost.df.pred = predict.gbm(boost.df,df.test,n.tree=5000);
calculateTestError(boost.df.pred,test.class);

#Boosting using adabag and Breiman coefficient
library(adabag);
adaboost.df = boosting(GAS ~ . - GAS, data=df.train);
adaboost.df.pred = predict(adaboost.df,df.test,type="class");
adaboost.df.pred$confusion;
adaboost.df.pred$error;
evol.train = errorevol(adaboost.df,newdata=df.train);
evol.test = errorevol(adaboost.df,newdata=df.test);

#Boosting using adabag and Zhu coefficient and SAMME algorithm
library(adabag);
adaboost.df = boosting(GAS ~ . - GAS, data=df.train, coeflearn="Zhu");
adaboost.df.pred = predict(adaboost.df,df.test,type="class");
adaboost.df.pred$confusion;
adaboost.df.pred$error;
evol.train = errorevol(adaboost.df,newdata=df.train);
evol.test = errorevol(adaboost.df,newdata=df.test);


#comparing error evolution in training and test set
plot(evol.test$error, type="l", xlab="Iterations", ylab="Error", col = "red") 
lines(evol.train$error, cex = .5 ,col="blue", lty=2);
legend("topright", c("Test","Train"), col = c("red", "blue"), lty=1:2);
