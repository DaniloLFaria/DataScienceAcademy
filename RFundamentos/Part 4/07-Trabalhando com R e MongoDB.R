# R e MongoDB

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap04")
getwd()

# Criando uma coleção no MongoDB (abrir o prompt e navegar até o diretório bin dentro do diretório de instalação do mongoDB e executar na linha de comando)
# *** Atenção *** - substituir /opt/DSA/RFundamentos/Parte3/ pelo diretório na sua máquina onde você salvou o arquivo zips.json
# ./mongoimport --db users --collection contatos --file /opt/DSA/RFundamentos/Parte3/zips.json

# O pacote rmongodb deve ser instalado a partir do repositório no Github.

# RMongoDB
# Instalação do Pacote
install.packages("devtools")
library("devtools")
install_github("mongosoup/rmongodb")
library(rmongodb)

# Criando a conexão
help("mongo.create")
mongo <- mongo.create()
mongo

# Checando a conexão
mongo.is.connected(mongo)

if(mongo.is.connected(mongo) == TRUE) {
  mongo.get.databases(mongo)
}

# Armazenando o nome de uma das coleções
coll <- "users.contatos"

# Contando os registros em uma coleção
help("mongo.count")
mongo.count(mongo, coll)

# Buscando um registro em uma coleção
mongo.find.one(mongo, coll)

# Obtendo um vetor de valores distintos das chaves de uma coleção
res <- mongo.distinct(mongo, coll, "city")
head(res)

# Obtendo um vetor de valores distintos das chaves de uma coleção
# E gerando um histograma
pop <- mongo.distinct(mongo, coll, "pop")
hist(pop)

# Contando os elementos
nr <- mongo.count(mongo, coll, list('pop' = list('$lte' = 2)))
print( nr )

# Buscando todos os elementos
pops <- mongo.find.all(mongo, coll, list('pop' = list('$lte' = 2)))
head(pops, 2)

# Encerrando a conexão
mongo.destroy(mongo)

# Criando e validando um arquivo json
library(jsonlite)
json_arquivo <- '{"pop":{"$lte":2}, "pop":{"$gte":1}}'
cat(prettify(json_arquivo))

validate(json_arquivo)















