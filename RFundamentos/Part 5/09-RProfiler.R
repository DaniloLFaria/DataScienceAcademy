# RProfiler

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap05")
getwd()

a <- c(1, 2, 3)
b <- c(4, 5, 6)

# Iniciando o profile
?Rprof
Rprof("debug.txt")
df = data.frame(a, b)
df

# Código que não deve fazer parte do profile
Rprof(NULL)
str(df)

# Interrompendo o profile
Rprof()

# Sumarizando os resultados
summaryRprof("debug.txt")


# Utilizando um arquivo temporário
Rprof(tmp <- tempfile())
example(glm)
Rprof()
summaryRprof(tmp)


install.packages("profr")
library(profr)
library(ggplot2)
?profr

x = profr(example(glm))
ggplot(x)






