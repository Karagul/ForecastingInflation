source("modelfunctions/functionsD/func-rlasso.R")
library(hdm)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180
alpha=1

## == presente == ##

rlasso1c=lasso.rolling.window(Y,nprev,1,1)
rlasso1p=lasso.rolling.window(Y,nprev,2,1)
rlasso2c=lasso.rolling.window(Y,nprev,1,2)
rlasso2p=lasso.rolling.window(Y,nprev,2,2)
rlasso3c=lasso.rolling.window(Y,nprev,1,3)
rlasso3p=lasso.rolling.window(Y,nprev,2,3)
rlasso4c=lasso.rolling.window(Y,nprev,1,4)
rlasso4p=lasso.rolling.window(Y,nprev,2,4)
rlasso5c=lasso.rolling.window(Y,nprev,1,5)
rlasso5p=lasso.rolling.window(Y,nprev,2,5)
rlasso6c=lasso.rolling.window(Y,nprev,1,6)
rlasso6p=lasso.rolling.window(Y,nprev,2,6)
rlasso7c=lasso.rolling.window(Y,nprev,1,7)
rlasso7p=lasso.rolling.window(Y,nprev,2,7)
rlasso8c=lasso.rolling.window(Y,nprev,1,8)
rlasso8p=lasso.rolling.window(Y,nprev,2,8)
rlasso9c=lasso.rolling.window(Y,nprev,1,9)
rlasso9p=lasso.rolling.window(Y,nprev,2,9)
rlasso10c=lasso.rolling.window(Y,nprev,1,10)
rlasso10p=lasso.rolling.window(Y,nprev,2,10)
rlasso11c=lasso.rolling.window(Y,nprev,1,11)
rlasso11p=lasso.rolling.window(Y,nprev,2,11)
rlasso12c=lasso.rolling.window(Y,nprev,1,12)
rlasso12p=lasso.rolling.window(Y,nprev,2,12)

# pols #
pols.rlasso1c=pols.rolling.window(Y,nprev,1,1,lasso1c$coef)
pols.rlasso1p=pols.rolling.window(Y,nprev,2,1,lasso1p$coef)
pols.rlasso2c=pols.rolling.window(Y,nprev,1,2,lasso2c$coef)
pols.rlasso2p=pols.rolling.window(Y,nprev,2,2,lasso2p$coef)
pols.rlasso3c=pols.rolling.window(Y,nprev,1,3,lasso3c$coef)
pols.rlasso3p=pols.rolling.window(Y,nprev,2,3,lasso3p$coef)
pols.rlasso4c=pols.rolling.window(Y,nprev,1,4,lasso4c$coef)
pols.rlasso4p=pols.rolling.window(Y,nprev,2,4,lasso4p$coef)
pols.rlasso5c=pols.rolling.window(Y,nprev,1,5,lasso5c$coef)
pols.rlasso5p=pols.rolling.window(Y,nprev,2,5,lasso5p$coef)
pols.rlasso6c=pols.rolling.window(Y,nprev,1,6,lasso6c$coef)
pols.rlasso6p=pols.rolling.window(Y,nprev,2,6,lasso6p$coef)
pols.rlasso7c=pols.rolling.window(Y,nprev,1,7,lasso7c$coef)
pols.rlasso7p=pols.rolling.window(Y,nprev,2,7,lasso7p$coef)
pols.rlasso8c=pols.rolling.window(Y,nprev,1,8,lasso8c$coef)
pols.rlasso8p=pols.rolling.window(Y,nprev,2,8,lasso8p$coef)
pols.rlasso9c=pols.rolling.window(Y,nprev,1,9,lasso9c$coef)
pols.rlasso9p=pols.rolling.window(Y,nprev,2,9,lasso9p$coef)
pols.rlasso10c=pols.rolling.window(Y,nprev,1,10,lasso10c$coef)
pols.rlasso10p=pols.rolling.window(Y,nprev,2,10,lasso10p$coef)
pols.rlasso11c=pols.rolling.window(Y,nprev,1,11,lasso11c$coef)
pols.rlasso11p=pols.rolling.window(Y,nprev,2,11,lasso11p$coef)
pols.rlasso12c=pols.rolling.window(Y,nprev,1,12,lasso12c$coef)
pols.rlasso12p=pols.rolling.window(Y,nprev,2,12,lasso12p$coef)


### == juntando tudo ==  ###

cpi=cbind(lasso1c$pred,lasso2c$pred,lasso3c$pred,lasso4c$pred,
          lasso5c$pred,lasso6c$pred,lasso7c$pred,lasso8c$pred,
          lasso9c$pred,lasso10c$pred,lasso11c$pred,lasso12c$pred)

pce=cbind(lasso1p$pred,lasso2p$pred,lasso3p$pred,lasso4p$pred,
          lasso5p$pred,lasso6p$pred,lasso7p$pred,lasso8p$pred,
          lasso9p$pred,lasso10p$pred,lasso11p$pred,lasso12p$pred)


pols.cpi=cbind(pols.lasso1c$pred,pols.lasso2c$pred,pols.lasso3c$pred,pols.lasso4c$pred,
               pols.lasso5c$pred,pols.lasso6c$pred,pols.lasso7c$pred,pols.lasso8c$pred,
               pols.lasso9c$pred,pols.lasso10c$pred,pols.lasso11c$pred,pols.lasso12c$pred)

pols.pce=cbind(pols.lasso1p$pred,pols.lasso2p$pred,pols.lasso3p$pred,pols.lasso4p$pred,
               pols.lasso5p$pred,pols.lasso6p$pred,pols.lasso7p$pred,pols.lasso8p$pred,
               pols.lasso9p$pred,pols.lasso10p$pred,pols.lasso11p$pred,pols.lasso12p$pred)



##
write.table(cpi,"forecasts/presenteD/lasso-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/lasso-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(pols.cpi,"forecasts/presenteD/pols-lasso-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pols.pce,"forecasts/presenteD/pols-lasso-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
