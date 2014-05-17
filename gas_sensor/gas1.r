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

ethanol = subset(df,df$GAS == 1);
ethylene = subset(df,df$GAS == 2);
ammonia = subset(df,df$GAS == 3);
acetaldehyde = subset(df,df$GAS == 4);
acetone = subset(df,df$GAS == 5);
toluene = subset(df,df$GAS == 6);

ethanol1 = subset(ethanol, ethanol$BATCH == 1);
ethylene1 = subset(ethylene, ethylene$BATCH == 1);
ammonia1 = subset(ammonia, ammonia$BATCH == 1);
acetaldehyde1 = subset(acetaldehyde, acetaldehyde$BATCH == 1);
acetone1 = subset(acetone, acetone$BATCH == 1);
toluene1 = subset(toluene, toluene$BATCH == 1);

ethanol2 = subset(ethanol, ethanol$BATCH == 2);
ethylene2 = subset(ethylene, ethylene$BATCH == 2);
ammonia2 = subset(ammonia, ammonia$BATCH == 2);
acetaldehyde2 = subset(acetaldehyde, acetaldehyde$BATCH == 2);
acetone2 = subset(acetone, acetone$BATCH == 2);
toluene2 = subset(toluene, toluene$BATCH == 2);

ethanol3 = subset(ethanol, ethanol$BATCH == 3);
ethylene3 = subset(ethylene, ethylene$BATCH == 3);
ammonia3 = subset(ammonia, ammonia$BATCH == 3);
acetaldehyde3 = subset(acetaldehyde, acetaldehyde$BATCH == 3);
acetone3 = subset(acetone, acetone$BATCH == 3);
# Batch 3 does not have any toluene
#toluene3 = subset(toluene, toluene$BATCH == 3);

ethanol4 = subset(ethanol, ethanol$BATCH == 4);
ethylene4 = subset(ethylene, ethylene$BATCH == 4);
ammonia4 = subset(ammonia, ammonia$BATCH == 4);
acetaldehyde4 = subset(acetaldehyde, acetaldehyde$BATCH == 4);
acetone4 = subset(acetone, acetone$BATCH == 4);
toluene4 = subset(toluene, toluene$BATCH == 4);

ethanol5 = subset(ethanol, ethanol$BATCH == 5);
ethylene5 = subset(ethylene, ethylene$BATCH == 5);
ammonia5 = subset(ammonia, ammonia$BATCH == 5);
acetaldehyde5 = subset(acetaldehyde, acetaldehyde$BATCH == 5);
acetone5 = subset(acetone, acetone$BATCH == 5);
toluene5 = subset(toluene, toluene$BATCH == 5);

ethanol6 = subset(ethanol, ethanol$BATCH == 6);
ethylene6 = subset(ethylene, ethylene$BATCH == 6);
ammonia6 = subset(ammonia, ammonia$BATCH == 6);
acetaldehyde6 = subset(acetaldehyde, acetaldehyde$BATCH == 6);
acetone6 = subset(acetone, acetone$BATCH == 6);
toluene6 = subset(toluene, toluene$BATCH == 6);

ethanol7 = subset(ethanol, ethanol$BATCH == 7);
ethylene7 = subset(ethylene, ethylene$BATCH == 7);
ammonia7 = subset(ammonia, ammonia$BATCH == 7);
acetaldehyde7 = subset(acetaldehyde, acetaldehyde$BATCH == 7);
acetone7 = subset(acetone, acetone$BATCH == 7);
toluene7 = subset(toluene, toluene$BATCH == 7);

ethanol8 = subset(ethanol, ethanol$BATCH == 8);
ethylene8 = subset(ethylene, ethylene$BATCH == 8);
ammonia8 = subset(ammonia, ammonia$BATCH == 8);
acetaldehyde8 = subset(acetaldehyde, acetaldehyde$BATCH == 8);
acetone8 = subset(acetone, acetone$BATCH == 8);
toluene8 = subset(toluene, toluene$BATCH == 8);
                  
ethanol9 = subset(ethanol, ethanol$BATCH == 9);
ethylene9 = subset(ethylene, ethylene$BATCH == 9);
ammonia9 = subset(ammonia, ammonia$BATCH == 9);
acetaldehyde9 = subset(acetaldehyde, acetaldehyde$BATCH == 9);
acetone9 = subset(acetone, acetone$BATCH == 9);
toluene9 = subset(toluene, toluene$BATCH == 9);

ethanol10 = subset(ethanol, ethanol$BATCH == 10);
ethylene10 = subset(ethylene, ethylene$BATCH == 10);
ammonia10 = subset(ammonia, ammonia$BATCH == 10);
acetaldehyde10 = subset(acetaldehyde, acetaldehyde$BATCH == 10);
acetone10 = subset(acetone, acetone$BATCH == 10);
toluene10 = subset(toluene, toluene$BATCH == 10);
                  

#Plot DR vs concentration for all batches
plot(ethanol$CONC, ethanol$S1DR);
plot(ethylene$CONC, ethylene$S1DR);
plot(ammonia$CONC, ammonia$S1DR);
plot(acetaldehyde$CONC, acetaldehyde$S1DR);
plot(acetone$CONC, acetone$S1DR);
plot(toluene$CONC, toluene$S1DR);

#Plot DR vs concentration for batch 1
plot(ethanol1$CONC, ethanol1$S1DR);
plot(ethylene1$CONC, ethylene1$S1DR);
plot(ammonia1$CONC, ammonia1$S1DR);
plot(acetaldehyde1$CONC, acetaldehyde1$S1DR);
plot(acetone1$CONC, acetone1$S1DR);
plot(toluene1$CONC, toluene1$S1DR);

#Plot DR vs concentration for batch 2
plot(ethanol2$CONC, ethanol2$S1DR);
plot(ethylene2$CONC, ethylene2$S1DR);
plot(ammonia2$CONC, ammonia2$S1DR);
plot(acetaldehyde2$CONC, acetaldehyde2$S1DR);
plot(acetone2$CONC, acetone2$S1DR);
plot(toluene2$CONC, toluene2$S1DR);

#Plot DR vs concentration for batch 3
plot(ethanol3$CONC, ethanol3$S1DR);
plot(ethylene3$CONC, ethylene3$S1DR);
plot(ammonia3$CONC, ammonia3$S1DR);
plot(acetaldehyde3$CONC, acetaldehyde3$S1DR);
plot(acetone3$CONC, acetone3$S1DR);

#Plot DR vs concentration for batch 4
plot(ethanol4$CONC, ethanol4$S1DR);
plot(ethylene4$CONC, ethylene4$S1DR);
plot(ammonia4$CONC, ammonia4$S1DR);
plot(acetaldehyde4$CONC, acetaldehyde4$S1DR);
plot(acetone4$CONC, acetone4$S1DR);
plot(toluene4$CONC, toluene4$S1DR);

#Plot DR vs concentration for batch 5
plot(ethanol5$CONC, ethanol5$S1DR);
plot(ethylene5$CONC, ethylene5$S1DR);
plot(ammonia5$CONC, ammonia5$S1DR);
plot(acetaldehyde5$CONC, acetaldehyde5$S1DR);
plot(acetone5$CONC, acetone5$S1DR);
plot(toluene5$CONC, toluene5$S1DR);

#Plot DR vs concentration for batch 6
plot(ethanol6$CONC, ethanol6$S1DR);
plot(ethylene6$CONC, ethylene6$S1DR);
plot(ammonia6$CONC, ammonia6$S1DR);
plot(acetaldehyde6$CONC, acetaldehyde6$S1DR);
plot(acetone6$CONC, acetone6$S1DR);
plot(toluene6$CONC, toluene6$S1DR);

#Plot DR vs concentration for batch 7
plot(ethanol7$CONC, ethanol7$S1DR);
plot(ethylene7$CONC, ethylene7$S1DR);
plot(ammonia7$CONC, ammonia7$S1DR);
plot(acetaldehyde7$CONC, acetaldehyde7$S1DR);
plot(acetone7$CONC, acetone7$S1DR);
plot(toluene7$CONC, toluene7$S1DR);

#Plot DR vs concentration for batch 8
plot(ethanol8$CONC, ethanol8$S1DR);
plot(ethylene8$CONC, ethylene8$S1DR);
plot(ammonia8$CONC, ammonia8$S1DR);
plot(acetaldehyde8$CONC, acetaldehyde8$S1DR);
plot(acetone8$CONC, acetone8$S1DR);
plot(toluene8$CONC, toluene8$S1DR);

#Plot DR vs concentration for batch 9
plot(ethanol9$CONC, ethanol9$S1DR);
plot(ethylene9$CONC, ethylene9$S1DR);
plot(ammonia9$CONC, ammonia9$S1DR);
plot(acetaldehyde9$CONC, acetaldehyde9$S1DR);
plot(acetone9$CONC, acetone9$S1DR);
plot(toluene9$CONC, toluene9$S1DR);

#Plot DR vs concentration for batch 10
plot(ethanol10$CONC, ethanol10$S1DR);
plot(ethylene10$CONC, ethylene10$S1DR);
plot(ammonia10$CONC, ammonia10$S1DR);
plot(acetaldehyde10$CONC, acetaldehyde10$S1DR);
plot(acetone10$CONC, acetone10$S1DR);
plot(toluene10$CONC, toluene10$S1DR);

#Plot sum of DR from all sensors vs concentration for batch 10
plot(ethanol10$CONC, ethanol10$S1DR + ethanol10$S2DR + ethanol10$S3DR + ethanol10$S4DR + ethanol10$S5DR 
     + ethanol10$S6DR + ethanol10$S7DR + ethanol10$S8DR + ethanol10$S9DR + ethanol10$S10DR + ethanol10$S11DR
     + ethanol10$S12DR + ethanol10$S13DR + ethanol10$S14DR + ethanol10$S15DR + ethanol10$S16DR,
     ylab = "S1DR", xlab='Concentration');

#Plot sum of DR from all sensors vs concentration for all batches
plot(ethanol$CONC, ethanol$S1DR + ethanol$S2DR + ethanol$S3DR + ethanol$S4DR + ethanol$S5DR 
     + ethanol$S6DR + ethanol$S7DR + ethanol$S8DR + ethanol$S9DR + ethanol$S10DR + ethanol$S11DR
     + ethanol$S12DR + ethanol$S13DR + ethanol$S14DR + ethanol$S15DR + ethanol$S16DR,
     ylab = "S1DR", xlab='Concentration');

#Plot sum of NDR from all sensors vs concentration for all batches
plot(ethanol$CONC, ethanol$S1NDR + ethanol$S2NDR + ethanol$S3NDR + ethanol$S4NDR + ethanol$S5NDR 
     + ethanol$S6NDR + ethanol$S7NDR + ethanol$S8NDR + ethanol$S9NDR + ethanol$S10NDR + ethanol$S11NDR
     + ethanol$S12NDR + ethanol$S13NDR + ethanol$S14NDR + ethanol$S15NDR + ethanol$S16NDR,
     ylab = "NDR", xlab='Concentration');

#PCA
pca <- prcomp(~ acetone$S1NDR + acetone$S1I_001 + acetone$CONC + acetone$S1I_01 + acetone$S1I_1 + 
                acetone$S1D_001 + acetone$S1D_01 + acetone$S1D_1, data=acetone,scale=TRUE);

ethanol.num <- subset(ethanol, select=-c(GAS,BATCH));
pca <- princomp(~ ., data=ethanol.num,scale=TRUE);
summary(pca,loadings=T)

sink("/home/puneet/mr/output/output.txt"); 
cor(ethanol1.num);
sink();

#Linear regression
ethanol.num <- subset(ethanol, select=-c(GAS,BATCH));
eth.lm <- lm(data=ethanol, S1NDR ~ S1I_001 + S1I_01 + S1I_1 + S1D_001 + S1D_01 + S1D_1 + CONC);
#eth1.lm <- lm(data=ethanol1.num, S1DR + S2DR + S3DR + S4DR + S5DR + S6DR + S7DR + S8DR + S9DR + S10DR + S11DR + S12DR + S13DR + S14DR + S15DR + S16DR ~.);
summary(eth.lm);

ethanol1.num <- subset(ethanol1, select=-c(GAS,BATCH));
eth1.lm <- lm(data=ethanol1, S1NDR ~ S1I_001 + S1I_01 + S1I_1 + S1D_001 + S1D_01 + S1D_1 + CONC);
summary(eth1.lm);

ethanol2.num <- subset(ethanol2, select=-c(GAS,BATCH));
eth2.lm <- lm(data=ethanol2, S1NDR ~ S1I_001 + S1I_01 + S1I_1 + S1D_001 + S1D_01 + S1D_1 + CONC);
eth2s2.lm <- lm(data=ethanol2, S2NDR ~ S2I_001 + S2I_01 + S2I_1 + S2D_001 + S2D_01 + S2D_1 + CONC);
summary(eth2s2.lm);

ethanol3.num <- subset(ethanol3, select=-c(GAS,BATCH));
eth3.lm <- lm(data=ethanol3, S1NDR ~ S1I_001 + S1I_01 + S1I_1 + S1D_001 + S1D_01 + S1D_1 + CONC);
summary(eth3.lm);

temp <- (subset(ethanol2, select=c(CONC,S1DR)));
temp[with(temp,order(CONC,S1DR)),];

plot(ethanol$CONC,ethanol$S1DR + ethanol$S2DR + ethanol$S3DR + ethanol$S4DR + ethanol$S5DR + ethanol$S6DR + ethanol$S7DR + ethanol$S8DR 
     + ethanol$S9DR + ethanol$S10DR + ethanol$S11DR + ethanol$S12DR + ethanol$S13DR + ethanol$S14DR + ethanol$S15DR + ethanol$S16DR);

plot(ethanol$CONC,ethanol$S1NDR + ethanol$S2NDR + ethanol$S3NDR + ethanol$S4NDR + ethanol$S5NDR + ethanol$S6NDR + ethanol$S7NDR + ethanol$S8NDR 
     + ethanol$S9NDR + ethanol$S10NDR + ethanol$S11NDR + ethanol$S12NDR + ethanol$S13NDR + ethanol$S14NDR + ethanol$S15NDR + ethanol$S16NDR);

#Handle outliers
eth1.box <- boxplot(ethanol1$S1DR ~ ethanol1$CONC, data=ethanol1);
eth1.clean <- subset(ethanol1, !S1DR %in% eth1.box$out);

eth2.box <- boxplot(ethanol2$S1DR ~ ethanol2$CONC, data=ethanol2);
eth2.clean <- subset(ethanol2, !S1DR %in% eth2.box$out);

#See summary of DR of all 16 sensors
ethanol.DR <- subset(ethanol, select=c(S1DR,S2DR,S3DR,S4DR,S5DR,S6DR,S7DR,S8DR,S9DR,S10DR,S11DR,S12DR,S13DR,S14DR,S15DR,S16DR));
summary(ethanol.DR);
