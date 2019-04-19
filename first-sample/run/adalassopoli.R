source("modelfunctions/func-polilasso.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=1

## == passado == ##

adalasso1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="adalasso")
adalasso1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="adalasso")
adalasso2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="adalasso")
adalasso2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="adalasso")
adalasso3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="adalasso")
adalasso3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="adalasso")
adalasso4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="adalasso")
adalasso4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="adalasso")
adalasso5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="adalasso")
adalasso5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="adalasso")
adalasso6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="adalasso")
adalasso6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="adalasso")
adalasso7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="adalasso")
adalasso7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="adalasso")
adalasso8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="adalasso")
adalasso8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="adalasso")
adalasso9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="adalasso")
adalasso9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="adalasso")
adalasso10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="adalasso")
adalasso10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="adalasso")
adalasso11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="adalasso")
adalasso11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="adalasso")
adalasso12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="adalasso")
adalasso12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="adalasso")


### == juntando tudo ==  ###

cpi=cbind(adalasso1c$pred,adalasso2c$pred,adalasso3c$pred,adalasso4c$pred,
          adalasso5c$pred,adalasso6c$pred,adalasso7c$pred,adalasso8c$pred,
          adalasso9c$pred,adalasso10c$pred,adalasso11c$pred,adalasso12c$pred)

pce=cbind(adalasso1p$pred,adalasso2p$pred,adalasso3p$pred,adalasso4p$pred,
          adalasso5p$pred,adalasso6p$pred,adalasso7p$pred,adalasso8p$pred,
          adalasso9p$pred,adalasso10p$pred,adalasso11p$pred,adalasso12p$pred)



##
write.table(cpi,"forecasts/passado2000/adalassopoli-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/adalassopoli-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
