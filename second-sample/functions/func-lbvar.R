
lbvar.rw=function(Y,p,lag,nprev,delta=0,lambda=0.05,variables=1){
  
  real=tail(Y,nprev)
  real2=Y[,variables]
  Y=head(Y,nrow(Y)-lag)
  dum=Y[,ncol(Y)]
  Y=Y[,-ncol(Y)]
  store.pred=matrix(NA,nprev,length(variables))
  store.covmat=matrix(NA,nprev,ncol(Y))
  for(i in 1:nprev){
    y.window=Y[(1+nprev-i):(nrow(Y)-i+1),]
    model=lbvar(y.window,p,delta=delta,lambda = lambda,xreg=dum)  
    covmat=sqrt(diag(model$covmat))
    pred=predict.HDeconometrics(model,h=lag,newdata = matrix(rep(0,lag),lag,1))[lag,variables]
    store.pred[i,]=pred
    store.covmat[i,]=covmat
    cat(i,"\n")
  }
  store.pred=store.pred[nrow(store.pred):1,]
  
  par(mfrow=c(2,1))
  plot(real2[,1],type="l")
  lines(c(rep(NA,nrow(real2)-nprev),store.pred[,1]),col="red")
  
  plot(real2[,2],type="l")
  lines(c(rep(NA,nrow(real2)-nprev),store.pred[,2]),col="red")
  
  
  rmse=sqrt(colMeans((tail(real[,1:2],nprev)-store.pred)^2))
  mae=colMeans(abs(tail(real[,1:2],nprev)-store.pred))
  errors=rbind("rmse"=rmse,"mae"=mae)
  
  
  return(list("pred"=store.pred,"errors"=errors,"covmat"=store.covmat,"real"=real[,variables]))
}
