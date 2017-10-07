# Análise de Séries Temporais

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap05")
getwd()

# Repositórios de Dados de Séries Temporais
# http://robjhyndman.com/tsdldata

# Importando dados com a função scan()
?scan
reis <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip = 3)
reis
class(reis)

# Transformando os dados em séries temporais
tsreis <- ts(reis)
tsreis
class(tsreis)
plot.ts(tsreis)


nascimentos <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
tsnascimentos <- ts(nascimentos, frequency = 12, start = c(1946, 1))
tsnascimentos
plot.ts(tsnascimentos)


# Pacote forecast
install.packages("forecast")
library(xts)
library(forecast)

# Cotação de ações da Petrobras
# Obs: O Yahoo está desativando o serviço de cotação online de ações
url <- "http://ichart.finance.yahoo.com/table.csv?s=IBM&a=00&b=2&c=1990&d=05&e=26&f=2016&g=d&ignore=.csv"

# Lendo o conteúdo da url para um dataframe
IBM.df <- read.table(url, header = TRUE, sep = ",")		

# Visualizando as primeiras linhas do dataframe
head(IBM.df)				

# Convertendo o dataframe em série temporal
IBM <- xts(IBM.df$Close, as.Date(IBM.df$Date))	
head(IBM)

# Construindo um plot
plot(IBM)		

# Criando um subset do conjunto de dados de séries temporais
IBM.2014 <- window(IBM,start="2014-01-01", end="2015-01-01")	

# Plotando
plot(IBM.2014)         

