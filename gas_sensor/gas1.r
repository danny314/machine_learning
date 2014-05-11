#Import preprocessed gas sensor array drift data set using space as the separator
gasdata = read.table(paste(Sys.getenv("HOME"),"/mr/preprocess/allbatches.dat",sep=""),header=F);

#Select only ethanol
eth = gasdata[which(gasdata$V1 == 1),];
dim(eth);
#Plot DR vs concentration
plot(eth$V2,eth$V3);

