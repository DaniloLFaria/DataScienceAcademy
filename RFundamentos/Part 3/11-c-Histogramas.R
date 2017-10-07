# Histogramas

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

?hist
?cars


# Definindo os dados
dados = cars$speed

# Construindo um histograma
hist(dados)
hist(dados, breaks = 10)
hist(dados, labels = T, breaks = c(0,5,10,20,30))
hist(dados, labels = T, breaks = 10)
hist(dados, labels = T, ylim = c(0,10), breaks = 10)


# Adicionando linhas ao histograma
hey = hist(dados, breaks = 10)
xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(hey$mids)*length(dados)

lines(xaxis, yaxis, col = "red")



