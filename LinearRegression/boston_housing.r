boston <-read.delim("~/BostonHousing.txt");
boston.mat <- model.matrix(~. - 1, boston);
boston.mat.clean <- subset(boston.mat, select = -c(MEDV))
 
#Lasso Shrinkage
boston.lasso <- glmnet(boston.mat.clean,boston$MEDV,alpha=1);
coef(boston.lasso,s=1);
coef(boston.lasso,s=0.5);
coef(boston.lasso,s=0.1);
coef(boston.lasso,s=0.01);

#Ridge shrinkage
boston.ridge <- glmnet(boston.mat.clean,boston$MEDV,alpha=0);
coef(boston.ridge,s=1);
coef(boston.ridge,s=0.5);
coef(boston.ridge,s=0.1);
coef(boston.ridge,s=0.01);

#Lasso after log transform
boston.xformed2 <- transform(boston,logB = log(B), logCRIM = log(CRIM));
boston.mat.xformed2 <- model.matrix(~. - 1, boston.xformed2);
boston.mat.xformed2.clean <- subset(boston.mat.xformed2, select = -c(MEDV));
boston.lasso.xformed2 <- glmnet(boston.mat.xformed2.clean,boston.xformed2$MEDV,alpha=1);
coef(boston.lasso.xformed2,s=0.5);

#Ridge after log transform
boston.ridge.xformed2 <- glmnet(boston.mat.xformed2.clean,boston.xformed2$MEDV,alpha=0);
coef(boston.ridge.xformed2,s=0.5);
