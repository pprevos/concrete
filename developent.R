library(AppliedPredictiveModeling)
data(concrete)

library(Hmisc)
concrete <- concrete[concrete$CompressiveStrength>=5,]
classes <- seq(5, 85, by=10)
concrete$Class <- cut(concrete$CompressiveStrength, classes, paste0("B", classes[-length(classes)]))
concrete <- concrete[,c(1,4,6,7,8,10)]
library(rpart.plot)
fit <- rpart(Class~., data=concrete)
prp(fit, extra=6, box.col=fit$frame$yval+1, ycompress=F, compress=F, 
    tweak=1.1, split.col="black", branch.col="black", nn.col="black")

Age<-28
Cement <- 200
Water<-100
CoarseAggregate<-800
FineAggregate<-800

mixture <- data.frame(Cement, Water, Age, CoarseAggregate, FineAggregate)
prediction <- predict(fit, mixture)
class <- colnames(prediction)[which.max(prediction)]

print(class)





