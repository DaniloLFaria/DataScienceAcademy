# Compreendendo a ordem dos fatores

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

# Níveis dos fatores
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (em ordem alfabética)
# e agrupa as estatísticas por níveis.

# Criando vetores
vec1 <- c(1001, 1002, 1003, 1004, 1005)
vec2 <- c(0, 1, 1, 0, 2)
vec3 <- c('Verde','Laranja','Azul','Laranja','Verde')

# Unindo os vetores em um dataframe
df <- data.frame(vec1, vec2, vec3)
df

# Verificando que o R categorizou a última coluna como fator
str(df)

# Verificando os níveis do fator. Perceba que os níveis estão categorizados em ordem alfabética
levels(df$vec3)

# Criando uma outra coluna e atribuindo labels
df$cat1 <- factor(df$vec3, labels = c("cor2", "cor1", "cor3"))
df

# Internamente, os fatores são registrados como inteiros, mas a ordenação segue a ordem alfabética
# das strings
str(df)

# Veja como foi feita a atribuição:
# Azul = cor2
# Laranja = cor1
# Verde = cor3
# Ou seja, os vetores com os labels, seguiram a ordem alfabética dos níveis classificados pelo R

# Criando uma outra coluna e atribuindo labels
# Ao aplicarmos a função factor() a coluna vec2, internamente o R classificou em ordem alfabética
# e quando atribuímos os labels, foi feita a associação.
df$cat2 <- factor(df$vec2, labels = c("Divorciado", "Casado", "Solteiro"))
df
str(df)
levels(df$cat2)














