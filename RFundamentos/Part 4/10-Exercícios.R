# Exercicios Capitulo 4

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap04")
getwd()

# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")

## Correto: write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")



# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:

df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

## Correto: 
  
df_iris <- read_csv("iris.csv", col_types = list(
    Sepal.Length = col_double(),
    Sepal.Width = col_double(),
    Petal.Length = col_double(),
    Petal.Width = col_double(),
    Species = col_factor(c("setosa", "versicolor", "virginica"))
))


# Exercicio 3 - Encontre e faça a correção do erro na instrução abaixo:

df2 <- read.xlsx("UrbanPop.xlsx", sheetIndex = 5)

## Correto: df2 <- read.xlsx("UrbanPop.xlsx", sheetIndex = 1)


# Exercicio 4 - Encontre e faça a correção do erro na instrução abaixo:

df_sono <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/sono.csv")
sleepData <- select(df_sono, nome, sono_total)
df_sono %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) 
  head

## Correto

df_sono <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/sono.csv")
sleepData <- select(df_sono, nome, sono_total)
df_sono %>% 
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>% 
  head




# Exercicio 5 - Encontre e faça a correção do erro na instrução abaixo:

set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"), 
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15), 
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score))  
  geom_point() + 
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)


## Correto

set.seed(1)
df3 <- data.frame(
  participante = c("p1", "p2", "p3", "p4", "p5", "p6"), 
  info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
  day1score = rnorm(n = 6, mean = 80, sd = 15), 
  day2score = rnorm(n = 6, mean = 88, sd = 8)
)

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) + 
  geom_point() + 
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)


