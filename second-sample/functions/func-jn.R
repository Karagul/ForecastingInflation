runjn=function(Y,indice,lag){
  
  dum=Y[,ncol(Y)]
  Y=Y[,-ncol(Y)]
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y,comp$scores[,1:4])
  aux=embed(Y2,4+lag)
  y=aux[,indice]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  i1=seq(1,ncol(X),ncol(Y)+4)
  i2=seq(ncol(Y)+4,ncol(X),ncol(Y)+4)
  
  auxX=list()
  for(i in 1:4){
    auxX[[i]]=X[,i1[i]:i2[i]]
  }
  
  X=auxX
  
  X.out=list()
  if(lag==1){
    for(i in 1:4){
      X.out[[i]]=tail(aux[,i1[i]:i2[i]],1)
    }
  }else{
    aux=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    for(i in 1:4){
      X.out[[i]]=tail(aux[,i1[i]:i2[i]],1)
    }
  }
  
  X[[1]]=cbind(X[[1]],tail(dum,length(y)))
  for(i in 2:4){
    X[[i]]=cbind(X[[i]],0)
  }
  fc=c(indice,ncol(X[[1]]))
  
  model=jackknife(X,y,lag=4,fixed.controls = fc)
  coef=model$coef
  weigths=model$weights
  
  for(i in 1:length(X.out)){
    X.out[[i]]=cbind(X.out[[i]],0)
  }
  
  pred=predict.HDeconometrics(model,X.out)
  
  return(list("model"=model,"pred"=pred,"weights"=weigths,"coef"=coef))
}


jackknife.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.weights=matrix(NA,nprev,ncol(Y)-2+4)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    jn=runjn(Y.window,indice,lag)
    save.pred[(1+nprev-i),]=jn$pred
    save.weights[(1+nprev-i),]=jn$weights
  
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"weights"=weights,"errors"=errors))
}
