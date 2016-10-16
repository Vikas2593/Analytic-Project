#Linear Discriminant Analysis
library(MASS)
View(iris)
head(iris)	
plot( iris[ , c(2,3)], 
      col = iris[,1])
iris.lda <- lda(Species ~ Petal.Length + Sepal.Width,
                data = iris)
iris.lda.p <- predict(iris.lda,
                      newdata=iris[ ,c(2,3)]
)$class
table(iris.lda.p,iris[ ,1])
