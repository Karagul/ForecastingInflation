source("modelfunctions/functionsD/func-nn.R")
load("dados/rawdata.RData")
library(h2o)
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180
h2o.init(nthreads = -2)



## == presente == ##
nn1c=nn.rolling.window(Y,nprev,1,1)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn1p=nn.rolling.window(Y,nprev,2,1)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn2c=nn.rolling.window(Y,nprev,1,2)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn2p=nn.rolling.window(Y,nprev,2,2)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn3c=nn.rolling.window(Y,nprev,1,3)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn3p=nn.rolling.window(Y,nprev,2,3)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn4c=nn.rolling.window(Y,nprev,1,4)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn4p=nn.rolling.window(Y,nprev,2,4)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn5c=nn.rolling.window(Y,nprev,1,5)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn5p=nn.rolling.window(Y,nprev,2,5)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn6c=nn.rolling.window(Y,nprev,1,6)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn6p=nn.rolling.window(Y,nprev,2,6)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn7c=nn.rolling.window(Y,nprev,1,7)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn7p=nn.rolling.window(Y,nprev,2,7)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn8c=nn.rolling.window(Y,nprev,1,8)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn8p=nn.rolling.window(Y,nprev,2,8)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn9c=nn.rolling.window(Y,nprev,1,9)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn9p=nn.rolling.window(Y,nprev,2,9)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn10c=nn.rolling.window(Y,nprev,1,10)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn10p=nn.rolling.window(Y,nprev,2,10)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn11c=nn.rolling.window(Y,nprev,1,11)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn11p=nn.rolling.window(Y,nprev,2,11)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn12c=nn.rolling.window(Y,nprev,1,12)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn12p=nn.rolling.window(Y,nprev,2,12)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")


### == juntando tudo ==  ###

cpi=cbind(nn1c$pred,nn2c$pred,nn3c$pred,nn4c$pred,
          nn5c$pred,nn6c$pred,nn7c$pred,nn8c$pred,
          nn9c$pred,nn10c$pred,nn11c$pred,nn12c$pred)

pce=cbind(nn1p$pred,nn2p$pred,nn3p$pred,nn4p$pred,
          nn5p$pred,nn6p$pred,nn7p$pred,nn8p$pred,
          nn9p$pred,nn10p$pred,nn11p$pred,nn12p$pred)


##
write.table(cpi,"forecasts/presenteD/nn-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/nn-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

h2o.shutdown()
Y