# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap10")
# getwd()

# Variavel que controla a execucao do script
Azure <- FALSE

if(Azure){
  source("src/Tools.R")
  Bikes <- maml.mapInputPort(1)
  Bikes$dteday <- set.asPOSIXct(Bikes)
}else{
  bikes <- bikes
}

## Convertendo a variavel dayWeek para fator ordenado e plotando em ordem de tempo
bikes$dayWeek <- fact.conv(bikes$dayWeek)

## Demanda de bikes x potenciais variaveis preditoras
labels <- list("Boxplots - Demanda de Bikes por Hora",
               "Boxplots - Demanda de Bikes por Estação",
               "Boxplots - Demanda de Bikes por Dia Útil",
               "Boxplots - Demanda de Bikes por Dia da Semana")

xAxis <- list("hr", "weathersit", "isWorking", "dayWeek")

plot.boxes  <- function(X, label){ 
  ggplot(bikes, aes_string(x = X, 
                               y = "cnt", 
                               group = X)) + 
    geom_boxplot( ) + ggtitle(label) +
    theme(text = element_text(size = 18)) }

Map(plot.boxes, xAxis, labels)



## Gera saida no Azure ML
if(Azure) maml.mapOutputPort('bikes')


