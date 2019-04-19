source("modelfunctions/func-polilasso.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=1

## == passado == ##

lasso1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
lasso1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="lasso")
lasso2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
lasso2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="lasso")
lasso3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
lasso3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="lasso")
lasso4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
lasso4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="lasso")
lasso5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
lasso5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="lasso")
lasso6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
lasso6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="lasso")
lasso7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
lasso7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="lasso")
lasso8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
lasso8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="lasso")
lasso9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
lasso9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="lasso")
lasso10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
lasso10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="lasso")
lasso11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
lasso11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="lasso")
lasso12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")
lasso12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="lasso")


### == juntando tudo ==  ###

cpi=cbind(lasso1c$pred,lasso2c$pred,lasso3c$pred,lasso4c$pred,
          lasso5c$pred,lasso6c$pred,lasso7c$pred,lasso8c$pred,
          lasso9c$pred,lasso10c$pred,lasso11c$pred,lasso12c$pred)

pce=cbind(lasso1p$pred,lasso2p$pred,lasso3p$pred,lasso4p$pred,
          lasso5p$pred,lasso6p$pred,lasso7p$pred,lasso8p$pred,
          lasso9p$pred,lasso10p$pred,lasso11p$pred,lasso12p$pred)



##
write.table(cpi,"forecasts/passado2000/lassopoli-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/lassopoli-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
