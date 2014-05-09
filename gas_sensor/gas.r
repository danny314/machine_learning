#Import gas sensor array drift data set using space as the separator
gadata = read.table("/home/puneet/mr/driftdataset/batch1.dat",header=F);

startIndex = 4;
endIndex = 20;

df = transform(gadata, GAS = substr(gadata$V1, 1, 1), conc = substr(gadata$V1,3, endIndex),
    #sensor 1               
    S1DR = substr(gadata$V2,3, endIndex), S1NDR = substr(gadata$V3,3, endIndex),
    S1I_001 = substr(gadata$V4,3, endIndex), S1I_01 = substr(gadata$V5,3, endIndex), S1I_1 = substr(gadata$V6,3, endIndex),
    S1D_001 = substr(gadata$V7,3, endIndex), S1D_01 = substr(gadata$V8,3, endIndex), S1D_1 = substr(gadata$V9,3, endIndex),
    
    #sensor 2
    S2DR = substr(gadata$V10,3, endIndex), S2NDR = substr(gadata$V11,4, endIndex),
    S2I_001 = substr(gadata$V12,4, endIndex), S2I_01 = substr(gadata$V13,4, endIndex), S2I_1 = substr(gadata$V14,4, endIndex),
    S2D_001 = substr(gadata$V15,4, endIndex), S2D_01 = substr(gadata$V16,4, endIndex), S2D_1 = substr(gadata$V17,4, endIndex),
    
    #sensor 3               
    S3DR = substr(gadata$V18,4, endIndex), S3NDR = substr(gadata$V19,4, endIndex),
    S3I_001 = substr(gadata$V20,4, endIndex), S3I_01 = substr(gadata$V21,4, endIndex), S3I_1 = substr(gadata$V22,4, endIndex),
    S3D_001 = substr(gadata$V23,4, endIndex), S3D_01 = substr(gadata$V24,4, endIndex), S3D_1 = substr(gadata$V25,4, endIndex),

    #sensor 4               
    S4DR = substr(gadata$V26,4, endIndex), S4NDR = substr(gadata$V27,4,endIndex),
    S4I_001 = substr(gadata$V28,4, endIndex), S4I_01 = substr(gadata$V29,4, endIndex), S4I_1 = substr(gadata$V30,4, endIndex),
    S4D_001 = substr(gadata$V31,4, endIndex), S4D_01 = substr(gadata$V32,4, endIndex), S4D_1 = substr(gadata$V33,4, endIndex),
    
    #sensor 5
    S5DR = substr(gadata$V34,4, endIndex), S5NDR = substr(gadata$V35,4, endIndex),
    S5I_001 = substr(gadata$V36,4, endIndex), S5I_01 = substr(gadata$V37,4, endIndex), S5I_1 = substr(gadata$V38,4, endIndex),
    S5D_001 = substr(gadata$V39,4, endIndex), S5D_01 = substr(gadata$V40,4, endIndex), S5D_1 = substr(gadata$V41,4, endIndex),
    
    #sensor 6               
    S6DR = substr(gadata$V42,4, endIndex), S6NDR = substr(gadata$V43,4, endIndex),
    S6I_001 = substr(gadata$V44,4, endIndex), S6I_01 = substr(gadata$V45,4, endIndex), S6I_1 = substr(gadata$V46,4, endIndex),
    S6D_001 = substr(gadata$V47,4, endIndex), S6D_01 = substr(gadata$V48,4, endIndex), S6D_1 = substr(gadata$V49,4, endIndex),

    #sensor 7               
    S7DR = substr(gadata$V50,4, endIndex), S7NDR = substr(gadata$V51,4, endIndex),
    S7I_001 = substr(gadata$V52,4, endIndex), S7I_01 = substr(gadata$V53,4, endIndex), S7I_1 = substr(gadata$V54,4, endIndex),
    S7D_001 = substr(gadata$V55,4, endIndex), S7D_01 = substr(gadata$V56,4, endIndex), S7D_1 = substr(gadata$V57,4, endIndex),
    
    #sensor 8
    S8DR = substr(gadata$V58,4, endIndex), S8NDR = substr(gadata$V59,4, endIndex),
    S8I_001 = substr(gadata$V60,4, endIndex), S8I_01 = substr(gadata$V61,4, endIndex), S8I_1 = substr(gadata$V62,4, endIndex),
    S8D_001 = substr(gadata$V63,4, endIndex), S8D_01 = substr(gadata$V64,4, endIndex), S8D_1 = substr(gadata$V65,4, endIndex),
    
    #sensor 9               
    S9DR = substr(gadata$V66,4, endIndex), S9NDR = substr(gadata$V67,4, endIndex),
    S9I_001 = substr(gadata$V68,4, endIndex), S9I_01 = substr(gadata$V69,4, endIndex), S9I_1 = substr(gadata$V70,4, endIndex),
    S9D_001 = substr(gadata$V71,4, endIndex), S9D_01 = substr(gadata$V72,4, endIndex), S9D_1 = substr(gadata$V73,4, endIndex),
    
    #sensor 10               
    S10DR = substr(gadata$V74,4, endIndex), S10NDR = substr(gadata$V75,4,endIndex),
    S10I_001 = substr(gadata$V76,4, endIndex), S10I_01 = substr(gadata$V77,4, endIndex), S10I_1 = substr(gadata$V78,4, endIndex),
    S10D_001 = substr(gadata$V79,4, endIndex), S10D_01 = substr(gadata$V80,4, endIndex), S10D_1 = substr(gadata$V81,4, endIndex),
    
    #sensor 11
    S11DR = substr(gadata$V82,4, endIndex), S11NDR = substr(gadata$V83,4, endIndex),
    S11I_001 = substr(gadata$V84,4, endIndex), S11I_01 = substr(gadata$V85,4, endIndex), S11I_1 = substr(gadata$V86,4, endIndex),
    S11D_001 = substr(gadata$V87,4, endIndex), S11D_01 = substr(gadata$V88,4, endIndex), S11D_1 = substr(gadata$V89,4, endIndex),
    
    #sensor 12              
    S12DR = substr(gadata$V90,4, endIndex), S12NDR = substr(gadata$V91,4, endIndex),
    S12I_001 = substr(gadata$V92,4, endIndex), S12I_01 = substr(gadata$V93,4, endIndex), S12I_1 = substr(gadata$V94,4, endIndex),
    S12D_001 = substr(gadata$V95,4, endIndex), S12D_01 = substr(gadata$V96,4, endIndex), S12D_1 = substr(gadata$V97,4, endIndex),

    #sensor 13               
    S13DR = substr(gadata$V98,4, endIndex), S13NDR = substr(gadata$V99,4, endIndex),
    S13I_001 = substr(gadata$V100,4, endIndex), S13I_01 = substr(gadata$V101,5, endIndex), S13I_1 = substr(gadata$V102,5, endIndex),
    S13D_001 = substr(gadata$V103,5, endIndex), S13D_01 = substr(gadata$V104,5, endIndex), S13D_1 = substr(gadata$V105,5, endIndex),
    
    #sensor 14               
    S14DR = substr(gadata$V106,5, endIndex), S14NDR = substr(gadata$V107,5,endIndex),
    S14I_001 = substr(gadata$V108,5, endIndex), S14I_01 = substr(gadata$V109,5, endIndex), S14I_1 = substr(gadata$V110,5, endIndex),
    S14D_001 = substr(gadata$V111,5, endIndex), S14D_01 = substr(gadata$V112,5, endIndex), S14D_1 = substr(gadata$V113,5, endIndex),
    
    #sensor 15
    S15DR = substr(gadata$V114,5, endIndex), S15NDR = substr(gadata$V115,5, endIndex),
    S15I_001 = substr(gadata$V116,5, endIndex), S15I_01 = substr(gadata$V117,5, endIndex), S15I_1 = substr(gadata$V118,5, endIndex),
    S15D_001 = substr(gadata$V119,5, endIndex), S15D_01 = substr(gadata$V120,5, endIndex), S15D_1 = substr(gadata$V121,5, endIndex),
    
    #sensor 16              
    S16DR = substr(gadata$V122,5, endIndex), S16NDR = substr(gadata$V123,5, endIndex),
    S16I_001 = substr(gadata$V124,5, endIndex), S16I_01 = substr(gadata$V125,5, endIndex), S16I_1 = substr(gadata$V126,5, endIndex),
    S16D_001 = substr(gadata$V127,5, endIndex), S16D_01 = substr(gadata$V128,5, endIndex), S16D_1 = substr(gadata$V129,5, endIndex)
);

head(df,1);

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


