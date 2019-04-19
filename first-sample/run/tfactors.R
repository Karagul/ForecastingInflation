library(HDeconometrics)
load("dados/rawdata2000.rda")
Y=dados

source("modelfunctions/func-fact.R")
source("modelfunctions/func-tfact.R")

nprev=132


## == passado == ##

tfact1c=tfact.rolling.window(Y,nprev,1,1)
tfact1p=tfact.rolling.window(Y,nprev,2,1)
tfact2c=tfact.rolling.window(Y,nprev,1,2)
tfact2p=tfact.rolling.window(Y,nprev,2,2)
tfact3c=tfact.rolling.window(Y,nprev,1,3)
tfact3p=tfact.rolling.window(Y,nprev,2,3)
tfact4c=tfact.rolling.window(Y,nprev,1,4)
tfact4p=tfact.rolling.window(Y,nprev,2,4)
tfact5c=tfact.rolling.window(Y,nprev,1,5)
tfact5p=tfact.rolling.window(Y,nprev,2,5)
tfact6c=tfact.rolling.window(Y,nprev,1,6)
tfact6p=tfact.rolling.window(Y,nprev,2,6)
tfact7c=tfact.rolling.window(Y,nprev,1,7)
tfact7p=tfact.rolling.window(Y,nprev,2,7)
tfact8c=tfact.rolling.window(Y,nprev,1,8)
tfact8p=tfact.rolling.window(Y,nprev,2,8)
tfact9c=tfact.rolling.window(Y,nprev,1,9)
tfact9p=tfact.rolling.window(Y,nprev,2,9)
tfact10c=tfact.rolling.window(Y,nprev,1,10)
tfact10p=tfact.rolling.window(Y,nprev,2,10)
tfact11c=tfact.rolling.window(Y,nprev,1,11)
tfact11p=tfact.rolling.window(Y,nprev,2,11)
tfact12c=tfact.rolling.window(Y,nprev,1,12)
tfact12p=tfact.rolling.window(Y,nprev,2,12)

### == juntando tudo ==  ###

cpi=cbind(tfact1c$pred,tfact2c$pred,tfact3c$pred,tfact4c$pred,
          tfact5c$pred,tfact6c$pred,tfact7c$pred,tfact8c$pred,
          tfact9c$pred,tfact10c$pred,tfact11c$pred,tfact12c$pred)

pce=cbind(tfact1p$pred,tfact2p$pred,tfact3p$pred,tfact4p$pred,
          tfact5p$pred,tfact6p$pred,tfact7p$pred,tfact8p$pred,
          tfact9p$pred,tfact10p$pred,tfact11p$pred,tfact12p$pred)


##
write.table(cpi,"forecasts/passado2000/tfact-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/tfact-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

