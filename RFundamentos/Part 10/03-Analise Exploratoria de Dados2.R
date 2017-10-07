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

## Avaliando a demanda por aluguel de bikes ao longo do tempo
## Construindo um time series plot para alguns determinados horarios em dias uteis e dias de fim de semana
times <- c(7, 9, 12, 15, 18, 20, 22) 

tms.plot <- function(times){
  ggplot(bikes[bikes$workTime == times, ], 
         aes(x = dteday, y = cnt)) +
    geom_line() +
    ylab("Numero de Bikes") +
    labs(title = paste("Demanda de Bikes as ",
                       as.character(times), ":00", sep = "")) +
    theme(text = element_text(size = 20))
}

require(ggplot2)
lapply(times, tms.plot)

## Gera saida no Azure ML
if(Azure) maml.mapOutputPort('bikes')


