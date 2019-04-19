
runbagg=function(Y,indice,lag){
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y,comp$scores[,1:4])
  aux=embed(Y2,4+lag)
  y=aux[,indice]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  if(lag==1){
    X.out=tail(aux,1)[1:ncol(X)]  
  }else{
    X.out=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    X.out=tail(X.out,1)[1:ncol(X)]
  }
  
  model=HDeconometrics::bagging(X,y,R=100,l=5,pre.testing = "group-joint")
  pred=predict(model,X.out)
  
  nselect=coef(model)
  nselect[nselect!=0]=1
  nselect[is.na(nselect)]=0
  nselect=colSums(nselect)
  
  return(list("model"=model,"pred"=pred,"nselect"=nselect))
}


bagg.rolling.window=function(Y,nprev,indice=1,lag=1){
  save.nselect=matrix(NA,nprev,21+ncol(Y[,-1])*4)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    bagg=runbagg(Y.window,indice,lag)
    save.pred[(1+nprev-i),]=bagg$pred
    save.nselect[(1+nprev-i),]=bagg$nselect
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"errors"=errors,"nselect"=save.nselect))
}
