spam.train <- subset(spam,test==FALSE);
spam.test <- subset(spam,test==TRUE);
spam.train.clean <- transform(spam.train,spamdummy=as.numeric(spam)-1);
spam.train.clean$spam <- NULL;
spam.train.clean$test <- NULL;
spam.train.std <- as.data.frame(scale(spam.train.clean,center=TRUE, scale=TRUE));
spam.train.std$spamdummy <- spam.train.clean$spamdummy;
spam.std.logit <- glm(spamdummy~., data=spam.train.std, family=binomial);
spam.train.cv <- ridge.cv(as.matrix(subset(spam.train.std, select=-c(spamdummy))), spam.train.std$spamdummy,plot.it=TRUE);
spam.train.cv$lambda.opt

#Training Error
mean(residuals(spam.std.logit))

spam.test.clean <- transform(spam.test,spamdummy=as.numeric(spam)-1);
spam.test.clean$spam <- NULL;
spam.test.clean$test <- NULL;
spam.test.std <- as.data.frame(scale(spam.test.clean,center=TRUE, scale=TRUE));
spam.test.pred <- predict(spam.std.logit,spam.test.std,type="response");

pred.class <- round(spam.test.pred)
spam.test.class.vector <- as.vector(spam.test$spam);
wrong.pred <- length( which(spam.test.class.vector != pred.class))
class.pred.error <- wrong.pred / length(spam.test.class.vector)
class.pred.error

#Log Transform
spam.predictors <- names(spam.train.clean)[-58]
spam.train.clean.log <- ddply(.data=spam.train.clean,.variables=spam.predictors,.fun=function(x) log(x+0.1)); 
spam.train.clean.log$spamdummy <- spam.train.clean$spamdummy;
spam.log.logit <- glm(spamdummy~., data=spam.train.clean.log, family=binomial);
mean(residuals(spam.log.logit))

spam.test.clean.log <- ddply(.data=spam.test.clean,.variables=spam.predictors,.fun=function(x) log(x+0.1));
spam.test.clean.log$spamdummy <- spam.test.clean$spamdummy;
spam.test.pred.log <- predict(spam.log.logit,spam.test.clean.log,type="response");
pred.log.class <- round(spam.test.pred.log);
wrong.log.pred <- length( which(spam.test.class.vector != pred.log.class));
class.log.pred.error <- wrong.log.pred / length(spam.test.class.vector);
class.log.pred.error;

#Binary Transform
spam.train.clean.bin <- ddply(.data=spam.train.clean,.variables=spam.predictors,.fun=function(x) ifelse(x>0,1,0));
spam.train.clean.bin$spamdummy <- spam.train.clean$spamdummy;
spam.bin.logit <- glm(spamdummy~., data=spam.train.clean.bin, family=binomial);
mean(residuals(spam.bin.logit));

spam.test.clean.bin <- ddply(.data=spam.test.clean,.variables=spam.predictors,.fun=function(x) ifelse(x>0,1,0));
spam.test.clean.bin$spamdummy <- spam.test.clean$spamdummy;
spam.test.pred.bin <- predict(spam.bin.logit,spam.test.clean.bin,type="response");
pred.bin.class <- round(spam.test.pred.bin);
wrong.bin.pred <- length( which(spam.test.class.vector != pred.bin.class));
class.bin.pred.error <- wrong.bin.pred / length(spam.test.class.vector);
class.bin.pred.error;


#ROC
preds.std <- prediction(spam.test.pred,spam.test.clean$spamdummy);
perf.std <- performance(preds.std, "tpr", "fpr");

lot(perf.std, main="ROC Curve for Spam Data (Scaled)", lwd=2, col="darkgreen");
text(0.5, 0.5, "AUC = 0.9652283", cex=2.2, col="darkred");

auroc.std <- attr(performance(preds.std, "auc"),"y.values")[[1]];
auroc.std
