# Fazendo Previsoes

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap11")
# getwd()

## Previsoes com um modelo de classificacao baseado em randomForest
require(randomForest)

# Gerando previsoes nos dados de teste
result_previsto <- data.frame( actual = Credit$CreditStatus,
                               previsto = predict(modelo, newdata = dados_teste))


# Visualizando o resultado
head(result_previsto)

