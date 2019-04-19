runrffact=function(Y,indice,lag,rfor){
  
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y,comp$scores[,1:4])
  aux=embed(Y2,4+lag)
  y=aux[,indice]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  #imp=rfor$save.importance[[1]][,1]
  imp=rfor[,1]
  #imp=imp[-length(imp)]
  dim(imp)=c(length(imp)/4,4)
  loadings=t(t(imp)/apply(imp,2,max))
  
  imp=rfor[,2]
  #imp=imp[-length(imp)]
  dim(imp)=c(length(imp)/4,4)
  loadings2=t(t(imp)/apply(imp,2,max))
  
  
  xlist=list()
  cc=1
  for(i in seq(1,ncol(X),ncol(X)/4)){
    xlist[[cc]]=X[,i:(-1+i+ncol(X)/4)]
    cc=cc+1
  }
  f1=f2=matrix(NA,nrow(X),4)
  for(i in 1:4){
    f1[,i]=t(loadings[,i])%*%t(xlist[[i]])
    f2[,i]=t(loadings2[,i])%*%t(xlist[[i]])
  }
  
  
  if(lag==1){
    X.out=tail(aux,1)[1:ncol(X)]  
  }else{
    X.out=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    X.out=tail(X.out,1)[1:ncol(X)]
  }
  dim(X.out)=c(ncol(X)/4,4)
  X.out=c(diag(t(X.out)%*%loadings),diag(t(X.out)%*%loadings2))
  
  
  model=lm(y~cbind(f1,f2))
  #model1=randomForest(cbind(X,dum),y)
  coeff=coef(model)
  coeff[is.na(coeff)]=0
  pred=c(1,X.out)%*%coeff
  
  return(list("model"=model,"pred"=pred))
}


rffact.rolling.window=function(Y,nprev,indice=1,lag=1,rfor){
  
  save.coef=matrix(NA,nprev,9)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    lasso=runrffact(Y.window,indice,lag,rfor[[i]])
    save.pred[(1+nprev-i),]=lasso$pred
    save.coef[(1+nprev-i),]=coef(lasso$model)
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"errors"=errors,"save.coef"=save.coef))
}

