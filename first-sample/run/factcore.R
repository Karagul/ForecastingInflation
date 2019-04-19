source("modelfunctions/func-fact.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))
nprev=132

## == passado == ##

fact1c=fact.rolling.window(Y,nprev,1,1)
fact2c=fact.rolling.window(Y,nprev,1,2)
fact3c=fact.rolling.window(Y,nprev,1,3)
fact4c=fact.rolling.window(Y,nprev,1,4)
fact5c=fact.rolling.window(Y,nprev,1,5)
fact6c=fact.rolling.window(Y,nprev,1,6)
fact7c=fact.rolling.window(Y,nprev,1,7)
fact8c=fact.rolling.window(Y,nprev,1,8)
fact9c=fact.rolling.window(Y,nprev,1,9)
fact10c=fact.rolling.window(Y,nprev,1,10)
fact11c=fact.rolling.window(Y,nprev,1,11)
fact12c=fact.rolling.window(Y,nprev,1,12)

### == juntando tudo ==  ###

corem=cbind(fact1c$pred,fact2c$pred,fact3c$pred,fact4c$pred,
          fact5c$pred,fact6c$pred,fact7c$pred,fact8c$pred,
          fact9c$pred,fact10c$pred,fact11c$pred,fact12c$pred)
corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))

##
write.table(corem,"forecasts/passado2000/fact-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

