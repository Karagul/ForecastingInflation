source("modelfunctions/func-rf.R")
library(HDeconometricsBeta)
library(randomForest)
load("dados/rawdata2000.rda")
Y=dados

nprev=132


## == presente == ##
set.seed(123)
rf1c=rf.rolling.window(Y,nprev,1,1)
rf1p=rf.rolling.window(Y,nprev,2,1)
rf2c=rf.rolling.window(Y,nprev,1,2)
rf2p=rf.rolling.window(Y,nprev,2,2)
rf3c=rf.rolling.window(Y,nprev,1,3)
rf3p=rf.rolling.window(Y,nprev,2,3)
rf4c=rf.rolling.window(Y,nprev,1,4)
rf4p=rf.rolling.window(Y,nprev,2,4)
rf5c=rf.rolling.window(Y,nprev,1,5)
rf5p=rf.rolling.window(Y,nprev,2,5)
rf6c=rf.rolling.window(Y,nprev,1,6)
rf6p=rf.rolling.window(Y,nprev,2,6)
rf7c=rf.rolling.window(Y,nprev,1,7)
rf7p=rf.rolling.window(Y,nprev,2,7)
rf8c=rf.rolling.window(Y,nprev,1,8)
rf8p=rf.rolling.window(Y,nprev,2,8)
rf9c=rf.rolling.window(Y,nprev,1,9)
rf9p=rf.rolling.window(Y,nprev,2,9)
rf10c=rf.rolling.window(Y,nprev,1,10)
rf10p=rf.rolling.window(Y,nprev,2,10)
rf11c=rf.rolling.window(Y,nprev,1,11)
rf11p=rf.rolling.window(Y,nprev,2,11)
rf12c=rf.rolling.window(Y,nprev,1,12)
rf12p=rf.rolling.window(Y,nprev,2,12)


### == juntando tudo ==  ###

cpi=cbind(rf1c$pred,rf2c$pred,rf3c$pred,rf4c$pred,
          rf5c$pred,rf6c$pred,rf7c$pred,rf8c$pred,
          rf9c$pred,rf10c$pred,rf11c$pred,rf12c$pred)

pce=cbind(rf1p$pred,rf2p$pred,rf3p$pred,rf4p$pred,
          rf5p$pred,rf6p$pred,rf7p$pred,rf8p$pred,
          rf9p$pred,rf10p$pred,rf11p$pred,rf12p$pred)


##
write.table(cpi,"forecasts/passado2000/rf-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/rf-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

