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
Azure = FALSE

if(Azure){
  restaurantes <- maml.mapInputPort(1)
  ratings <- maml.mapInputPort(2) 
}else{
  restaurantes  <- read.csv("Restaurant-features.csv", 
                           sep = ",", header = T, stringsAsFactors = F )
  ratings <- read.csv("Restaurant-ratings.csv", 
                      sep = ",", header = T, stringsAsFactors = F)
}

restaurantes <- restaurantes[restaurantes$franchise == 'f' &
                               restaurantes$alcohol != 'No_Alcohol_Served', ]

require(dplyr)
df <- as.data.frame(restaurantes %>%
                       inner_join(ratings, by = 'placeID') %>%
                       select(name, rating) %>%
                       group_by(name) %>%
                       summarize(ave_Rating = mean(rating)) %>%
                       arrange(desc(ave_Rating))) 
df

if(Azure) maml.mapOutputPort("df")