#Import gas sensor array drift data set using space as the separator
gadata = read.table("/home/puneet/mr/driftdataset/batch1.dat",header=F);

#View data
head(gadata);
