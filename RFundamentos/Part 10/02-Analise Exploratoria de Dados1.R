# Este codigo contem comandos para filtrar e plotar os dados de aluguel de bikes, dados que estao em nosso dataset
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
  bikes <- maml.mapInputPort(1)
  bikes$dteday <- set.asPOSIXct(bikes)
}else{
  bikes <- bikes
}

str(bikes)

# Verificando a correlacao entre as variaveis preditoras
bikes$count <- bikes$cnt - predict(lm(cnt ~ dteday, data = bikes), newdata = bikes)

cols <- c("mnth", "hr", "holiday", "workingday",
          "weathersit", "temp", "hum", "windspeed",
          "isWorking", "monthCount", "dayWeek", 
          "workTime", "xformHr", "count")

# Metodos de Correlacao
# Pearson - coeficiente usado para medir o grau de relacionamento entre duas variaveis com relacao linear
# Spearman - eh um teste nao parametrico, para medir o grau de relacionamento entre duas variaveis
# Kendall - eh um teste nao parametrico, para medir a forca de dependencia entre duas variaveis
metodos <- c("pearson", "spearman")

cors <- lapply( metodos, function(method) 
  (cor(bikes[, cols], method = method)))

head(cors)

require(lattice)
plot.cors <- function(x, labs){
  diag(x) <- 0.0 
  plot( levelplot(x, 
                  main = paste("Plot de Correlação usando Método", labs),
                  scales = list(x = list(rot = 90), cex = 1.0)) )
}

Map(plot.cors, cors, metodos)

## Gera saida no Azure ML
if(Azure) maml.mapOutputPort('bikes')