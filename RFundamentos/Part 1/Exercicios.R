m <- matrix(1:11, nrow=2)

View(iris)

vetor = c("Danilo", "FARIA")
names(vetor) = c("Nome", "Sobrenome")
vetor["Sobrenome"]
matrix(c(1,2,3,4), nr=2)

mat = matrix(c("Danilo", "Faria", "Cris", "Arruda"), nr=2, byrow=T)
mat
dimnames(mat) = list(c("Linha 1", "Linha 2"),c("Nome", "SobreNome") )
t(mat)
solve(mat)
m1 = matrix(c(1,2,3,4), nr=2)
m2 = matrix(c(5,6,7,8),nr=2)
m1
m2
cbind(m1,m2)
teste = c(rbind(m1,m2))
teste
rbind(m1,m2)

library(stringr)

str_count("teste", "n")

dfcars <- data.frame(mtcars)

head(dfcars)
tail(dfcars)

head(dfcars[3])
head(dfcars$mpg)
nrow(dfcars)
ncol(dfcars)


ex1 = c(1:12)
ex1

ex2 = matrix(c(1:16), nr=4)
ex2

ex3 = list(ex1, ex2)
ex3

ex4 = data.frame(read.table(file = "http://data.princeton.edu/wws509/datasets/effort.dat"))
ex4

ex5 = ex4
names(ex5) = c("config", "esfc", "chang")
ex5

ex6 = data.frame(iris)
ex6
dim(ex6)

ex7 = data.frame(c(iris$Sepal.Length, iris$Sepal.Width))
plot(iris$Sepal.Length, iris$Sepal.Width)


?subset()

ex8 = subset(iris, Sepal.Length > 7)
ex8
mode(ex8)

library(dplyr)

?slice()


ex9 = slice(data.frame(iris), 1:15)
ex9

plot(ex9$Sepal.Length, ex9$Sepal.Width, type="h")
?plot()

?filter()
ex10 = filter(ex9, Sepal.Length > 6)
ex10


sessionInfo()

x = 2
while(x < 4)
{
  x = x + 1
  print(x)
}

mtcars[4,7]



