heart.data <- read.csv("~/heart.csv");
heart.data$X <- NULL;
heart.clean <- transform(heart.data,CHD=as.numeric(CHD)-1);

#We now do logistic regression -
heart.logit <- glm(CHD ~ SBP+TOBACCO+LDL+ADIPOSITY+FAMHIST+TYPEA+OBESITY+ALCOHOL+AGE, data=heart.clean, family=binomial("logit"));
summary(heart.logit);

#We now compute the training error -
mean(residuals(heart.logit));

#We now remove the three least significant variables and do logistic regression on the reduced data set.

heart.clean.red$SBP <- NULL;
heart.clean.red$ADIPOSITY <- NULL;
heart.clean.red$ALCOHOL <- NULL;
heart.logit.red <- glm(CHD ~ TOBACCO+LDL+FAMHIST+TYPEA+OBESITY+AGE, data=heart.clean.red, family=binomial("logit"));
summary(heart.logit.red);

#We now compute the training error on the reduced data set -
mean(residuals(heart.logit.red));

#5 Fold Cross Validation on Full Data Set 
library("DAAG", lib.loc="~/R/x86_64-pc-linux-gnu-library/2.14");
CVbinary(heart.logit, rand=NULL, nfolds=5, print.details=TRUE);

#5 Fold Cross Validation on Reduced Data Set
CVbinary(heart.logit.red, rand=NULL, nfolds=5, print.details=TRUE);



