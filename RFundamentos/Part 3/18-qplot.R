# qplot

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

# Um sistema gráfico completo, alternativo ao sistema básico de gráficos do R
# Oferece mais opções de modificação, legendas prontas, formatação mais sólida

library(ggplot2)
x = runif(1000)
plot(x)
qplot(x)

?qplot
qplot(x, main = "Dist Uniforme 1000", ylab = 'y', xlab = 'x')

head(iris)
qplot(x = Sepal.Length, y = Sepal.Width, data = iris, color = Species, geom = "line")

qplot(x = Sepal.Length, y = Sepal.Width, data = iris, color = Species) + geom_line()

qplot(x = Sepal.Length, y = Sepal.Width, data = iris, color = Species, geom = "point")

qplot(x = Sepal.Length, y = Sepal.Width, data = iris, color = Species, geom = "smooth", method = 'lm', se = F)

qplot(x = Sepal.Length, y = Sepal.Width, data = iris, color = Species, geom = "jitter")


# Histogramas
x=rnorm(10000)
options(warn=-1)
qplot(x, geom="histogram")
qplot(x, geom="histogram", binwidth=0.5, xlim=c(-3,3))
qplot(x, geom="histogram", breaks=c(-3,-1.5,-1,-0.5,0,1.5,2,3), xlim=c(-3,3))
qplot(x, geom="density")
qplot(Sepal.Length, data=iris, geom="density", colour=Species)
qplot(Sepal.Length, data=iris, geom="density", facets=Species~. )
qplot(Sepal.Length, data=iris, geom="density", facets=.~Species )
qplot(x=Sepal.Length, y=Sepal.Width, data=iris, color=Species)
qplot(x=Sepal.Length, y=Sepal.Width, data=iris, size=Species)
qplot(x=Sepal.Length, y=Sepal.Width, data=iris, shape=Species)
qplot(x=Sepal.Length, y=Sepal.Width, data=iris, alpha=Species)
qplot(x=Sepal.Length, y=Sepal.Width, data=iris, color=Species, size=Species, shape=Species)


# ggplot
mydata <- data.frame(x=1:5, y=11:15, group=c("F", "F", "M", "M", "F"))
mydata
?ggplot
p <- ggplot(data=mydata, aes(x=x,y=y)) 
p+geom_point()
p+geom_point(aes(color=group), shape=3)
p+geom_point(aes(color=group), shape=3) + scale_color_manual(values=c(123,569))
p+geom_point() + scale_x_continuous(limits=c(0,10))













