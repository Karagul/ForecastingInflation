runfact=function(Y,indice,lag){
  
  dum=Y[,ncol(Y)]
  Y=Y[,-ncol(Y)]
  
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y[,indice],comp$scores[,1:4])
  aux=embed(Y2,4+lag)
  y=aux[,1]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  
  if(lag==1){
    X.out=tail(aux,1)[1:ncol(X)]  
  }else{
    X.out=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    X.out=tail(X.out,1)[1:ncol(X)]
  }
  dum=tail(dum,length(y))
  bb=Inf
  for(i in seq(5,20,5)){
    m=lm(y~X[,1:i]+dum)
    crit=BIC(m)
    if(crit<bb){
      bb=crit
      model=m
      f.coef=coef(model)
      coefdum=f.coef[length(f.coef)]
      f.coef=f.coef[-length(f.coef)]
    }
  }
  coef=rep(0,ncol(X)+1)
  coef[1:length(f.coef)]=f.coef
  coef=c(coef,coefdum)
  coef[is.na(coef)]=0
  
  pred=c(1,X.out,0)%*%coef
  
  return(list("model"=model,"pred"=pred,"coef"=coef))
}



fact.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.coef=matrix(NA,nprev,21+1)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    fact=runfact(Y.window,indice,lag)
    save.coef[(1+nprev-i),]=fact$coef
    save.pred[(1+nprev-i),]=fact$pred
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"coef"=save.coef,"errors"=errors))
}

