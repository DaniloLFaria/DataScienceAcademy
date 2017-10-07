# Manipulação de Arquivos Excel

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap04")
getwd()

# Instalar o Java - JDK 
# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

# Windows
# Faça o download do JDK gratuitamente no site da Oracle
# Instale no seu computador
# Configure a variável de ambiente JAVA_HOME apontantando para o diretório de instalação do JDK

# Mac e Linux
# Faça o download do JDK gratuitamente no site da Oracle
# Instale no seu computador
# Abra um terminal e execute: sudo R CMD javareconf

# ********** Pacotes que requerem Java **********
# Java previsa estar instalado no seu computador
# XLConnect
# xlsx
# rJava 

# ********** Pacotes que requerem Perl **********
# É necessário instalar o interpretador da linguagem Perl
# gdata

# readxl

# Instalando os pacotes
install.packages('rJava')
install.packages("xlsx")
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(readxl)
library(rJava)
library(xlsx)
library(XLConnect)
library(gdata)

# Obs: Ao carregar todos os pacotes que manipulam excel, pode gerar problema de namespace, pois alguns pacotes
# possuem o mesmo nome de funções (que são diferentes entre os pacotes). Para evitar problemas, carregue e use
# os pacotes de forma individual (não carregue todos os pacotes de uma única vez).

# Pacote readxl

# Lista as worksheet no arquivo Excel
excel_sheets("UrbanPop.xlsx")

# Lendo a planilha do Excel
read_excel("UrbanPop.xlsx")
head(read_excel("UrbanPop.xlsx"))
read_excel("UrbanPop.xlsx", sheet = "Period2")
read_excel("UrbanPop.xlsx", sheet = 3)
read_excel("UrbanPop.xlsx", sheet = 4)

# Importando uma worksheet para um dataframe
df <- read_excel("UrbanPop.xlsx", sheet = 3)
head(df)

# Importando todas as worksheets
df_todas <- lapply(excel_sheets("UrbanPop.xlsx"), read_excel, path = 'UrbanPop.xlsx')
df_todas
class(df_todas)


# Pacote XLConnect
arq1 = XLConnect::loadWorkbook("UrbanPop.xlsx")
df1 = readWorksheet(arq1, sheet = "Period1", header = TRUE)
df1
class(df)


# Pacote xlsx
df2 <- read.xlsx("UrbanPop.xlsx", sheetIndex = 1)
df2

df3 <- read.xlsx2("UrbanPop.xlsx",
                 sheetIndex = 1,
                 startRow = 2,
                 colIndex = 2)
df3


df4 <- readWorksheetFromFile("UrbanPop.xlsx",
                            sheet = 1,
                            startRow = 4,
                            endCol = 2)
df4



write.xlsx(df4, "df4.xlsx", sheetName = "Data Frame")
dir()


# Pacote gdata
arq1 <- xls2csv("df4.xlsx",
              sheet = 1,
              na.strings = "EMPTY")
arq1




