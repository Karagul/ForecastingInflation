source("modelfunctions/func-nn.R")
load("dados/rawdata2000.rda")
library(h2o)
Y=dados
nprev=132
h2o.init(nthreads = -2)



## == presente == ##
nn1c=nn.rolling.window(Y,nprev,1,1)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn1p=nn.rolling.window(Y,nprev,2,1)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn2c=nn.rolling.window(Y,nprev,1,2)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn2p=nn.rolling.window(Y,nprev,2,2)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn3c=nn.rolling.window(Y,nprev,1,3)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn3p=nn.rolling.window(Y,nprev,2,3)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn4c=nn.rolling.window(Y,nprev,1,4)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn4p=nn.rolling.window(Y,nprev,2,4)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn5c=nn.rolling.window(Y,nprev,1,5)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn5p=nn.rolling.window(Y,nprev,2,5)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn6c=nn.rolling.window(Y,nprev,1,6)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn6p=nn.rolling.window(Y,nprev,2,6)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn7c=nn.rolling.window(Y,nprev,1,7)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn7p=nn.rolling.window(Y,nprev,2,7)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn8c=nn.rolling.window(Y,nprev,1,8)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn8p=nn.rolling.window(Y,nprev,2,8)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn9c=nn.rolling.window(Y,nprev,1,9)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn9p=nn.rolling.window(Y,nprev,2,9)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn10c=nn.rolling.window(Y,nprev,1,10)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn10p=nn.rolling.window(Y,nprev,2,10)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn11c=nn.rolling.window(Y,nprev,1,11)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn11p=nn.rolling.window(Y,nprev,2,11)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y
h2o.init(nthreads = -2)
nn12c=nn.rolling.window(Y,nprev,1,12)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
nn12p=nn.rolling.window(Y,nprev,2,12)
save.image("~/Dropbox/tese/inflacao jbes/wsaux.RData")
h2o.shutdown()
Y



### == juntando tudo ==  ###

cpi=cbind(nn1c$pred,nn2c$pred,nn3c$pred,nn4c$pred,
          nn5c$pred,nn6c$pred,nn7c$pred,nn8c$pred,
          nn9c$pred,nn10c$pred,nn11c$pred,nn12c$pred)

pce=cbind(nn1p$pred,nn2p$pred,nn3p$pred,nn4p$pred,
          nn5p$pred,nn6p$pred,nn7p$pred,nn8p$pred,
          nn9p$pred,nn10p$pred,nn11p$pred,nn12p$pred)


##
write.table(cpi,"forecasts/passado2000/nn-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/nn-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

