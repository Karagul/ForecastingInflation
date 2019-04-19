source("modelfunctions/func-lasso.R")
library(HDeconometricsBeta)
load("dados/rawdata.RData")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
Y=cbind(core=core$core,dados)
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))

nprev=180
alpha=1

## == presente == ##

lasso1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
lasso2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
lasso3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
lasso4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
lasso5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
lasso6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
lasso7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
lasso8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
lasso9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
lasso10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
lasso11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
lasso12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")

### == juntando tudo ==  ###

corem=cbind(lasso1c$pred,lasso2c$pred,lasso3c$pred,lasso4c$pred,
          lasso5c$pred,lasso6c$pred,lasso7c$pred,lasso8c$pred,
          lasso9c$pred,lasso10c$pred,lasso11c$pred,lasso12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

##
write.table(corem,"forecasts/presenteD/lasso-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
