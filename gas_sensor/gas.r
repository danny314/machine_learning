#Import gas sensor array drift data set using space as the separator
gadata = read.table("/home/puneet/mr/driftdataset/batch1.dat",header=F);
df = transform(gadata, gaslabel = substr(gadata$V1, 1, 1), V1 = substr(gadata$V1,3, 10) );
head(df);

df2 <- as.data.frame(sapply(gadata[1],gsub,pattern=";",replacement=""))
head(df2)
t(substr(gadata[1],1,200))
substr(gadata[1],1,1)
dat1 <- data.frame(do.call(rbind, strsplit(as.vector(gadata[1]), split = ";")))
head(dat1);

splitStr = strsplit(as.character(gadata[1]),";");

head(splitStr);

require(reshape2);

gaslabel = strsplit(as.character(gadata[1]),";",fixed=TRUE);
typeof(gaslabel)
nrow(gaslabel);
gaslabel = t(gaslabel);
nrow(gaslabel);

gadata = gadata[,2:129];
gadata = cbind(gaslabel,gadata);
head(gadata);


