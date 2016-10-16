library(e1071)
data(iris)
View(iris)
str(iris)
table(iris$Species)
head(iris)
set.seed(9850)
runif(5)
gp <- runif(nrow(iris))
gp
iris5 <- iris[order(gp),] 
str(iris)
head(iris5)
head(iris5,10)
str(iris5)
summary(iris5[,c(1,2,3,4)])


normalize <- function(x) {
  +return (( x- min(x)) / (max(x) - min(x) ))
}
normalize(c(1,2,3,4,5))

iris_n <- as.data.frame(lapply(iris5[,c(1,2,3,4)], normalize))
str(iris_n)
summary(iris_n)


iris_train <- iris_n[1:129,]
iris_test <- iris_n[130:150,]

iris_train_target <- iris5[1:129, 5]
iris_test_target <- iris5[130:150, 5]

model <- naiveBayes(Species ~., data=iris,na.action.na.omit)
model <- naiveBayes(Species ~., data=iris,na.action.na.pass)
pred <- predict(model,iris)
table(pred,iris$Species)
plot(pred)
