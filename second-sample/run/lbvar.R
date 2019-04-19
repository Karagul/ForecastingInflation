library(HDeconometrics)
load("dados/rawdata.RData")
source("modelfunctions/functionsD/func-lbvar.R")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)
nprev=180
p=4


## == presente == ## 
lbv1=lbvar.rw(Y,p,lag=1,nprev,variables = c(1:2))
lbv2=lbvar.rw(Y,p,lag=2,nprev,variables = c(1:2))
lbv3=lbvar.rw(Y,p,lag=3,nprev,variables = c(1:2))
lbv4=lbvar.rw(Y,p,lag=4,nprev,variables = c(1:2))
lbv5=lbvar.rw(Y,p,lag=5,nprev,variables = c(1:2))
lbv6=lbvar.rw(Y,p,lag=6,nprev,variables = c(1:2))
lbv7=lbvar.rw(Y,p,lag=7,nprev,variables = c(1:2))
lbv8=lbvar.rw(Y,p,lag=8,nprev,variables = c(1:2))
lbv9=lbvar.rw(Y,p,lag=9,nprev,variables = c(1:2))
lbv10=lbvar.rw(Y,p,lag=10,nprev,variables = c(1:2))
lbv11=lbvar.rw(Y,p,lag=11,nprev,variables = c(1:2))
lbv12=lbvar.rw(Y,p,lag=12,nprev,variables = c(1:2))

aux=list(lbv1$pred,lbv2$pred,lbv3$pred,lbv4$pred,lbv5$pred,lbv6$pred,lbv7$pred,lbv8$pred,
         lbv9$pred,lbv10$pred,lbv11$pred,lbv12$pred)

cpi=pce=ip=matrix(NA,nprev,12)
for(i in 1:length(aux)){
  cpi[,i]=aux[[i]][,1]
  pce[,i]=aux[[i]][,2]
}



## == salvar == ##

write.table(cpi,"forecasts/presenteD/lbvar-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/lbvar-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
