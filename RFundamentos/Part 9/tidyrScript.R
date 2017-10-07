# Este codigo contem comandos para filtrar e plotar os dados de aluguel de bikes, dados que estao em nosso dataset
# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio.

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
#setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap09")
#getwd()

# Variavel que controla a execucao do script
Azure <- FALSE

# Obs: também é necessário instalar o pacote rlang como dependência.

if(Azure){
  Pesquisa <- maml.mapInputPort(1)
  ## Instala o pacote tidyr e a dependência tibble a partir do arquivo zip
  install.packages("src/tibble_1.3.1.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/tidyr_0.6.3.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/rlang_0.1.1.zip", lib = ".", repos = NULL, verbose = TRUE)
  require(tibble, lib.loc = ".")
  require(tidyr, lib.loc = ".")
  require(rlang, lib.loc = ".")
}else{
  Pesquisa <- read.csv("pesquisa.csv", sep = ",", header = T, stringsAsFactors = F )
  require(tidyr)
}

df <- spread(Pesquisa, Questao, Resposta)
df

Pesquisa2 <- gather(df, Resposta, value, 2:6)
Pesquisa2

if(Azure) maml.mapOutputPort("df")