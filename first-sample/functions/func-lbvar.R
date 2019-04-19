
lbvar.rw=function(Y,p,lag,nprev,delta=0,lambda=0.05,variables=1){
  real=tail(Y,nprev)
  Y=head(Y,nrow(Y)-lag)
  store.pred=matrix(NA,nprev,length(variables))
  store.covmat=matrix(NA,nprev,ncol(Y))
  for(i in 1:nprev){
    y.window=Y[(1+nprev-i):(nrow(Y)-i+1),]
    model=lbvar(y.window,p,delta=delta,lambda = lambda)  
    covmat=sqrt(diag(model$covmat))
    pred=predict.HDeconometrics(model,h=lag)[lag,variables]
    store.pred[i,]=pred
    store.covmat[i,]=covmat
    cat(i,"\n")
  }
  store.pred=store.pred[nrow(store.pred):1,]
  return(list("pred"=store.pred,"covmat"=store.covmat,"real"=real[,variables]))
}
