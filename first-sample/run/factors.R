source("modelfunctions/func-fact.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados


nprev=132


## == passado == ##

fact1c=fact.rolling.window(Y,nprev,1,1)
fact1p=fact.rolling.window(Y,nprev,2,1)
fact2c=fact.rolling.window(Y,nprev,1,2)
fact2p=fact.rolling.window(Y,nprev,2,2)
fact3c=fact.rolling.window(Y,nprev,1,3)
fact3p=fact.rolling.window(Y,nprev,2,3)
fact4c=fact.rolling.window(Y,nprev,1,4)
fact4p=fact.rolling.window(Y,nprev,2,4)
fact5c=fact.rolling.window(Y,nprev,1,5)
fact5p=fact.rolling.window(Y,nprev,2,5)
fact6c=fact.rolling.window(Y,nprev,1,6)
fact6p=fact.rolling.window(Y,nprev,2,6)
fact7c=fact.rolling.window(Y,nprev,1,7)
fact7p=fact.rolling.window(Y,nprev,2,7)
fact8c=fact.rolling.window(Y,nprev,1,8)
fact8p=fact.rolling.window(Y,nprev,2,8)
fact9c=fact.rolling.window(Y,nprev,1,9)
fact9p=fact.rolling.window(Y,nprev,2,9)
fact10c=fact.rolling.window(Y,nprev,1,10)
fact10p=fact.rolling.window(Y,nprev,2,10)
fact11c=fact.rolling.window(Y,nprev,1,11)
fact11p=fact.rolling.window(Y,nprev,2,11)
fact12c=fact.rolling.window(Y,nprev,1,12)
fact12p=fact.rolling.window(Y,nprev,2,12)

### == juntando tudo ==  ###

cpi=cbind(fact1c$pred,fact2c$pred,fact3c$pred,fact4c$pred,
          fact5c$pred,fact6c$pred,fact7c$pred,fact8c$pred,
          fact9c$pred,fact10c$pred,fact11c$pred,fact12c$pred)

pce=cbind(fact1p$pred,fact2p$pred,fact3p$pred,fact4p$pred,
          fact5p$pred,fact6p$pred,fact7p$pred,fact8p$pred,
          fact9p$pred,fact10p$pred,fact11p$pred,fact12p$pred)


##
write.table(cpi,"forecasts/passado2000/fact-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/fact-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

