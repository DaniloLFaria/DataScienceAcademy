# Bar Plots

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

?barplot

# Preparando os dados
casamentos <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67),
                     nrow = 3, byrow = T)

# Nomeando a matriz
colnames(casamentos) <- c("0","1-150","151-300",">300")
rownames(casamentos) <- c("Casado","Divorciado","Solteiro")


# Construindo o plot
barplot(casamentos)
barplot(casamentos, beside = T)

# Transposta da matriz
barplot(t(casamentos), beside = T)


