#Read LA 2009 data and replace masked strings with NA
la09_na <- read.csv("~/Documents/NonWork/DataMining/Project/2009/unzip/PDD_LA_comma_2009.csv", header=TRUE, na.strings=c("*","***","ZZZZZ","zzzzz","XXXXX","xxxxx",""," ","NA"));
#south09_na <- read.csv("~/Documents/NonWork/DataMining/Project/2009/unzip/PDD_South_comma_2009.csv", header=TRUE, na.strings=c("*","***","ZZZZZ","zzzzz","XXXXX","xxxxx",""," ","NA"));
#la09_na <- rbind(la09_na,south09_na);
#south09_na <- NULL;
#gc();
#north09_na <- read.csv("~/Documents/NonWork/DataMining/Project/2009/unzip/PDD_North_comma_2009.csv", header=TRUE, na.strings=c("*","***","ZZZZZ","zzzzz","XXXXX","xxxxx",""," ","NA"));
#la09_na <- rbind(la09_na,north09_na);
#north09_na <- NULL;
#gc();
nrow(la09_na);

#Select a subset of columns that we are interested in
la09.1 <- subset(la09_na,select=c(typ_care, agecat5, sex, ethncty, race, patzip, patcnty, los, charge,  diag_p, adm_qtr, 
          adm_yr, pay_cat, pay_type, pay_plan, ecode_p, epoa_p, proc_p, odiag1));

#Convert non-numeric fields to factors so that R does not try to do mathematical calculations on them.
la09.f <- transform(la09.1,typ_care=factor(typ_care), agecat5=factor(agecat5), sex=factor(sex), ethncty=factor(ethncty), race=factor(race),
          patzip=factor(patzip), patcnty=factor(patcnty), diag_p=factor(diag_p), adm_qtr=factor(adm_qtr), adm_yr=factor(adm_yr),
          pay_cat=factor(pay_cat), pay_type=factor(pay_type), pay_plan=factor(pay_plan)
          ,ecode_p=factor(ecode_p), epoa_p=factor(epoa_p), proc_p=factor(proc_p), odiag1=factor(odiag1)
           );

#Concatenate ethnicity and race to come up with a single column 'ethrace'.
la09.f$ethrace <- factor(paste(la09.f$ethncty, la09.f$race,sep="_"));

#Create a new column that has only first three digits of zip
la09.f$patzip3 <- factor(substr(la09.f$patzip,1,3));

#Compute n most frequent values of variables so that number of variables do not get out of control when doing regression.
patzip3.top5  = names(sort(summary(factor(la09.f$patzip3)), decreasing=TRUE)[c(1:20)]);
agecat5.top5 = names(summary(factor(la09.f$agecat5))[c(1:5)]);
diag_p.top6 = names(summary(factor(la09.f$diag_p))[c(1:20)]);  
pay_cat.top6 = names(summary(factor(la09.f$pay_cat))[c(1:6)]);  
pay_plan.top6 = names(summary(factor(la09.f$pay_plan))[c(1:6)]);  
ethrace.top10 = names(summary(factor(la09.f$ethrace))[c(1:5)]);
ecode_p.top5 = names(summary(factor(la09.f$ecode_p))[c(1:5)]);  
epoa_p.top5 = names(summary(factor(la09.f$epoa_p))[c(1:5)]);
proc_p.top5 = names(summary(factor(la09.f$proc_p))[c(1:5)]);
odiag1.top5 = names(summary(factor(la09.f$odiag1))[c(1:5)]);

#Subset the data set to pick values that only belong top the top n values computed above.
la09.top <- subset(la09.f, patzip3 %in% patzip3.top5 & agecat5 %in% agecat5.top5 & diag_p %in% diag_p.top6 & 
                     pay_cat %in% pay_cat.top6 & pay_plan %in% pay_plan.top6 & ethrace %in% ethrace.top10
                     & proc_p %in% proc_p.top5 & odiag1 %in% odiag1.top5);
nrow(la09.top);


#This step will reduce get reduce of unused levels resulting from the top n transformation.
la09.top$patzip3.top <- factor(la09.top$patzip3);
la09.top$agecat5.top <- factor(la09.top$agecat5);
la09.top$diag_p.top <- factor(la09.top$diag_p);
la09.top$pay_cat.top <- factor(la09.top$pay_cat);
la09.top$pay_plan.top <- factor(la09.top$pay_plan);
la09.top$ethrace.top <- factor(la09.top$ethrace);
la09.top$ecode_p.top <- factor(la09.top$ecode_p);
la09.top$epoa_p.top <- factor(la09.top$epoa_p);
la09.top$proc_p.top <- factor(la09.top$proc_p);
la09.top$odiag1.top <- factor(la09.top$odiag1);

#split data into training and test (70% training and 30% test)
train.idx <-sample(nrow(la09.top), floor(nrow(la09.top)*0.8), replace=FALSE);
la09.top.train <- la09.top[train.idx, ];
la09.top.test <- la09.top[-train.idx,];

# Run linear regression with interaction terms
la09.lm <- lm(data=la09.top.train, charge ~ patzip3.top +  agecat5.top + diag_p.top + typ_care + 
                pay_plan.top + pay_cat.top + ethrace.top + proc_p.top + odiag1
                + (agecat5.top * diag_p.top) + (proc_p.top * diag_p.top)  + (proc_p.top * agecat5.top)
                + (proc_p.top * odiag1.top) );

#Print summary of regression
summary(la09.lm);

#predict the test data. This variable will now contain the predicted values of charge.
la09.predict <- predict(la09.lm,la09.top.test);

#Transpose the columns to rows so that RMS error is easy to compute
la09.pred.stack <- stack(la09.predict);
la09.rmse <- sqrt(mean((la09.pred.stack$values - la09.top.test$charge)^2));
paste("====================== Test for normal regression = ",la09.rmse," ==================");

#Doing Lasso and Ridge regression
#Convert data frames to a matrices for training and test data sets
la09.train.mat <- model.matrix(charge ~ patzip3.top +  agecat5.top + diag_p.top + typ_care + 
                                 pay_plan.top + pay_cat.top + ethrace.top + proc_p.top + odiag1
                               + (agecat5.top * diag_p.top) + (proc_p.top * diag_p.top)  + (proc_p.top * agecat5.top)
                               + (proc_p.top * odiag1.top),data=la09.top.train);

la09.test.mat <- model.matrix(charge ~ patzip3.top +  agecat5.top + diag_p.top + typ_care + 
                                pay_plan.top + pay_cat.top + ethrace.top + proc_p.top + odiag1
                              + (agecat5.top * diag_p.top) + (proc_p.top * diag_p.top)  + (proc_p.top * agecat5.top)
                              + (proc_p.top * odiag1.top),data=la09.top.test);

la09.cv.glmnet <- cv.glmnet(la09.train.mat,la09.top.train$charge);

lambda.optimal <- la09.cv.glmnet$lambda.min;
lambda.optimal;

lambda.1se <- la09.cv.glmnet$lambda.1se;
lambda.1se;
gc();
#la09.pred.glmnet <- predict(la09.cv.glmnet$glmnet.fit,la09.test.mat);

# Do prediction using lambda that minimizes cross validation error for lasso regression
la09.lasso.optimal <- glmnet(la09.train.mat,la09.top.train$charge,alpha=1,lambda=lambda.optimal);
la09.pred.optimal <- predict(la09.lasso.optimal,la09.test.mat);
la09.lasso.rmse <- sqrt(mean((la09.pred.optimal - la09.top.test$charge)^2));
paste("===== Test Error with lasso regression and lambda ",lambda.optimal," is" ,la09.lasso.rmse," ====");
gc();

# Do prediction using lambda that minimizes cross validation error for ridge regression
la09.ridge.optimal <- glmnet(la09.train.mat,la09.top.train$charge,alpha=0,lambda=lambda.optimal);
la09.pred.optimal <- predict(la09.ridge.optimal,la09.test.mat);
la09.ridge.rmse <- sqrt(mean((la09.pred.optimal - la09.top.test$charge)^2));
paste("====== Test Error with ridge regression and lambda ",lambda.optimal," is" ,la09.ridge.rmse," ======");
gc();

# Do prediction using lambda such that error is within 1 standard deviation of minimum for lasso regression
la09.lasso.1se <- glmnet(la09.train.mat,la09.top.train$charge,alpha=1,lambda=lambda.1se);
la09.pred.1se <- predict(la09.lasso.1se,la09.test.mat);
la09.lasso.rmse <- sqrt(mean((la09.pred.1se - la09.top.test$charge)^2));
paste("=== Test Error with lasso regression and lambda ",lambda.1se," is" ,la09.lasso.rmse," ====");
gc();

# Do prediction using lambda such that error is within 1 standard deviation of minimum for ridge regression
la09.ridge.1se <- glmnet(la09.train.mat,la09.top.train$charge,alpha=0,lambda=lambda.1se);
la09.pred.1se <- predict(la09.ridge.1se,la09.test.mat);
la09.ridge.rmse <- sqrt(mean((la09.pred.1se - la09.top.test$charge)^2));
paste("== Test Error with lasso regression and lambda ",lambda.1se," is" ,la09.ridge.rmse," ====");
gc();

