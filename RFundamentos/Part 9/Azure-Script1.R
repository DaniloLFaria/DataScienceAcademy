# Este codigo contem comandos para filtrar e plotar os dados de aluguel de bikes, dados que estao em nosso dataset
# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
#setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap09")
#getwd()

# Variavel que controla a execucao do script
Azure <- FALSE

# Execucao de acordo com o valor da variavel Azure
if(Azure){
  source("src/Tools.R")
  Bikes <- maml.mapInputPort(1)
  Bikes$dteday <- set.asPOSIXct(Bikes)
}else{
  source("Tools.R")
  Bikes <- read.csv("bikes.csv", sep = ",", header = T, stringsAsFactors = F )
  Bikes$dteday <- char.toPOSIXct(Bikes)
}

require(dplyr)
print("Dimensões do dataframe antes das operações de transformação:")
print(dim(Bikes))

# Filtrando o dataframe
Bikes <- Bikes %>% filter(cnt > 100)

print("Dimensões do dataframe após as operações de transformação:")
print(dim(Bikes))

# ggplot2
require(ggplot2)
qplot(dteday, cnt, data = subset(Bikes, hr == 9), geom = "line")

# Resultado
if(Azure) maml.mapOutputPort("Bikes")