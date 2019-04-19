source("modelfunctions/func-boosting.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados

nprev=132

## == passado == ##

boosting1c=boosting.rolling.window(Y,nprev,1,1)
boosting1p=boosting.rolling.window(Y,nprev,2,1)
boosting2c=boosting.rolling.window(Y,nprev,1,2)
boosting2p=boosting.rolling.window(Y,nprev,2,2)
boosting3c=boosting.rolling.window(Y,nprev,1,3)
boosting3p=boosting.rolling.window(Y,nprev,2,3)
boosting4c=boosting.rolling.window(Y,nprev,1,4)
boosting4p=boosting.rolling.window(Y,nprev,2,4)
boosting5c=boosting.rolling.window(Y,nprev,1,5)
boosting5p=boosting.rolling.window(Y,nprev,2,5)
boosting6c=boosting.rolling.window(Y,nprev,1,6)
boosting6p=boosting.rolling.window(Y,nprev,2,6)
boosting7c=boosting.rolling.window(Y,nprev,1,7)
boosting7p=boosting.rolling.window(Y,nprev,2,7)
boosting8c=boosting.rolling.window(Y,nprev,1,8)
boosting8p=boosting.rolling.window(Y,nprev,2,8)
boosting9c=boosting.rolling.window(Y,nprev,1,9)
boosting9p=boosting.rolling.window(Y,nprev,2,9)
boosting10c=boosting.rolling.window(Y,nprev,1,10)
boosting10p=boosting.rolling.window(Y,nprev,2,10)
boosting11c=boosting.rolling.window(Y,nprev,1,11)
boosting11p=boosting.rolling.window(Y,nprev,2,11)
boosting12c=boosting.rolling.window(Y,nprev,1,12)
boosting12p=boosting.rolling.window(Y,nprev,2,12)

### == juntando tudo ==  ###

cpi=cbind(boosting1c$pred,boosting2c$pred,boosting3c$pred,boosting4c$pred,
          boosting5c$pred,boosting6c$pred,boosting7c$pred,boosting8c$pred,
          boosting9c$pred,boosting10c$pred,boosting11c$pred,boosting12c$pred)

pce=cbind(boosting1p$pred,boosting2p$pred,boosting3p$pred,boosting4p$pred,
          boosting5p$pred,boosting6p$pred,boosting7p$pred,boosting8p$pred,
          boosting9p$pred,boosting10p$pred,boosting11p$pred,boosting12p$pred)


write.table(cpi,"forecasts/passado2000/boosting-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/boosting-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
