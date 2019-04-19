runrfols=function(Y,indice,lag){
  dum=Y[,ncol(Y)]
  Y=Y[,-ncol(Y)]
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
  
  dum=tail(dum,length(y))
  predaux=rep(0,500)
  
  for(k in 1:500){
    model=randomForest(X,y,keep.inbag = TRUE,ntree=1,importance = TRUE)
    samples=model$inbag
    imp=model$importance
    saux=samples[,1]
    sboot=c()
    for(i in 1:length(saux)){
      sboot=c(sboot,rep(i,saux[i]))
    }
    
    selected=which(imp[,1]>0)
    penalty.factor=c(abs(imp[selected,2])^(-1),0)
    xaux=X[sboot,selected]
    yaux=y[sboot]
    
    
    #tr=getTree(model,1)
    #selected=unique(tr[,3])
    #selected=sort(selected[selected>0])
    modellasso=ic.glmnet(cbind(xaux,dum[sboot]),yaux,penalty.factor=penalty.factor)
    cols=coef(modellasso)
    
    predaux[k]=c(1,X.out[selected],0)%*%cols
  }
  
  pred=mean(predaux)
  
  return(pred)
}


rfols.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    lasso=runrfols(Y.window,indice,lag)
    save.pred[(1+nprev-i),]=lasso
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"errors"=errors))
}

