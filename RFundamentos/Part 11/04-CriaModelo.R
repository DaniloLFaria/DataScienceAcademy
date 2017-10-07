# Criando o Modelo Preditivo no R

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap11")
# getwd()

## Criar um modelo de classificacao baseado em randomForest
library(randomForest)

# Cross Tabulation
?table
table(Credit$CreditStatus)

# Funcao para gerar dados de treino e dados de teste
splitData <- function(dataframe, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  index <- 1:nrow(dataframe)
  trainindex <- sample(index, trunc(length(index)/2))
  trainset <- dataframe[trainindex, ]
  testset <- dataframe[-trainindex, ]
  list(trainset = trainset, testset = testset)
}

# Gerando dados de treino e de teste
splits <- splitData(Credit, seed = 808)

# Separando os dados
dados_treino <- splits$trainset
dados_teste <- splits$testset

# Verificando o numero de linhas
nrow(dados_treino)
nrow(dados_teste)
  
# Construindo o modelo
modelo <- randomForest( CreditStatus ~ CheckingAcctStat
                       + Duration_f
                       + Purpose
                       + CreditHistory
                       + SavingsBonds
                       + Employment
                       + CreditAmount_f, 
                       data = dados_treino, 
                       ntree = 100, nodesize = 10)

# Imprimondo o resultado
print(modelo)



