# Importação de outros Softwares Estatísticos

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap05")
getwd()

# Instaland o pacote
install.packages("haven")
library(haven)


# SAS
vendas <- read_sas("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/vendas.sas7bdat")
?read_sas
class(vendas)
print(vendas)
str(vendas)


# Stata
df_stata <- read_dta("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/mov.dta")
class(df_stata)
str(df_stata)

# Convert values in Date column to dates
df_stata$Date <- as.Date(as_factor(df_stata$Date))
str(df_stata)
plot(df_stata)


# SPSS
pessoas <- read_sav("pessoas.sav")
class(pessoas)
head(pessoas)



# Pacote Foreign

install.packages("foreign")
library(foreign)

# Stata
florida <- read.dta("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/florida.dta")
tail(florida)
class(florida)


# SPSS
# http://cw.routledge.com/textbooks/9780415372985/resources/datasets.asp

dados <- read.spss("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte4/international.sav")
class(dados)
head(dados)
df <- data.frame(dados)
df
head(df)


# Criando um boxplot
boxplot(df$gdp)


# Se você estiver familiarizado com estatística, você vai ter ouvido falar de Correlação. 
# É uma medida para avaliar a dependência linear entre duas variáveis. 
# Ela pode variar entre -1 e 1; 
# Se próximo de 1, significa que há uma forte associação positiva entre as variáveis. 
# Se próximo de -1, existe uma forte associação negativa: 
# Quando a correlação entre duas variáveis é 0, essas variáveis são possivelmente independentes: 
# Ou seja, não há nenhuma associação entre X e Y.

# Coeficiente de Correlação. Indica uma associação negativa entre GDP e alfabetização feminina
cor(df$gdp, df$f_illit)


# **** Importante ****
# Correlação não implica causalidade
# A correlação, isto é, a ligação entre dois eventos, não implica 
# necessariamente uma relação de causalidade, ou seja, que um dos 
# eventos tenha causado a ocorrência do outro. A correlação pode 
# no entanto indicar possíveis causas ou áreas para um estudo mais 
# aprofundado, ou por outras palavras, a correlação pode ser uma 
# pista.











