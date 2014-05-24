Colleges <- read.delim("~/Colleges.txt")
Colleges$board <- NULL;
Colleges$room <- NULL;
Colleges$college.name <- NULL;
Colleges.clean <- Colleges[complete.cases(Colleges),];

colleges.norm2 <- scale(Colleges.clean, center=TRUE, scale=TRUE);
collges.pca <- prcomp(collges.norm2);
plot(collges.pca);

summary(colleges.pca);
colleges.pca$rotation;

