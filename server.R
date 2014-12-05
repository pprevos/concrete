library(AppliedPredictiveModeling)
library(Hmisc)
library(rpart.plot)
library(rpart)

data(concrete)
concrete <- concrete[concrete$CompressiveStrength>=5,]
classes <- seq(5, 85, by=10)
concrete$Class <- cut(concrete$CompressiveStrength, classes, paste0("C", classes[-length(classes)]))
concrete <- concrete[,c(1,4,6,7,8,10)]
fit <- rpart(Class~., data=concrete)

shinyServer(function(input, output) {
        #Show input values
        output$cement <- renderText({ 
                paste("Cement:", input$Cement, "kg/m3")
        })
        output$water <- renderText({ 
                paste("Water:", input$Water, "l/m3")
        })
        output$course <- renderText({ 
                paste("Course Aggregate:", input$CoarseAggregate, "kg/m3")
        })
        output$fine <- renderText({ 
                paste("Fine aggregate:", input$FineAggregate, "kg/m3")
        })
        output$age <- renderText({ 
                paste("Age:", input$Age, "days")
        })
        #Strength class prediction
        output$predict <- renderText({
                mixture <- data.frame(Cement=input$Cement, Water=input$Water, Age=input$Age, 
                           CoarseAggregate=input$CoarseAggregate, 
                           FineAggregate=input$FineAggregate)
                prediction <- predict(fit, mixture)
                class <- colnames(prediction)[which.max(prediction)]
                paste("The most likely strength class is", class)
        })
        #Show decission tree
        output$plot <- renderPlot({
                par(mar=rep(0,4))
                prp(fit, extra=6, box.col=fit$frame$yval+1, ycompress=F, compress=F, 
                    tweak=1.1, split.col="black", branch.col="black", nn.col="black")
        })
        
})
