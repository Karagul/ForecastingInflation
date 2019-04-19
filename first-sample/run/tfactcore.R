library(HDeconometrics)
source("modelfunctions/func-fact.R")
source("modelfunctions/func-tfact.R")
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))
nprev=132


## == passado == ##

tfact1c=tfact.rolling.window(Y,nprev,1,1)
tfact2c=tfact.rolling.window(Y,nprev,1,2)
tfact3c=tfact.rolling.window(Y,nprev,1,3)
tfact4c=tfact.rolling.window(Y,nprev,1,4)
tfact5c=tfact.rolling.window(Y,nprev,1,5)
tfact6c=tfact.rolling.window(Y,nprev,1,6)
tfact7c=tfact.rolling.window(Y,nprev,1,7)
tfact8c=tfact.rolling.window(Y,nprev,1,8)
tfact9c=tfact.rolling.window(Y,nprev,1,9)
tfact10c=tfact.rolling.window(Y,nprev,1,10)
tfact11c=tfact.rolling.window(Y,nprev,1,11)
tfact12c=tfact.rolling.window(Y,nprev,1,12)

### == juntando tudo ==  ###

corem=cbind(tfact1c$pred,tfact2c$pred,tfact3c$pred,tfact4c$pred,
          tfact5c$pred,tfact6c$pred,tfact7c$pred,tfact8c$pred,
          tfact9c$pred,tfact10c$pred,tfact11c$pred,tfact12c$pred)
corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))


##
write.table(corem,"forecasts/passado2000/tfact-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

