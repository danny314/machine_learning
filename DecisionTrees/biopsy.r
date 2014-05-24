library("MASS");
data("biopsy");
biopsy = biopsy[,-1];       
biopsy = na.omit(biopsy);   

#Gini split
biopsy.fit.gini <- rpart(class ~ V1+V2+V3+V4+V5+V6+V7+V8+V9, data=biopsy, method="class",parms=list(split="gini"),maxdepth=2)
plot(biopsy.fit.gini);
text(biopsy.fit.gini);
print(biopsy.fit.gini);

#Entropy split
biopsy.fit.entropy <- rpart(class ~ V1+V2+V3+V4+V5+V6+V7+V8+V9, data=biopsy, method="class",parms=list(split="information"),maxdepth=2);
plot(biopsy.fit.entropy);
text(biopsy.fit.entropy);
print(biopsy.fit.entropy);

