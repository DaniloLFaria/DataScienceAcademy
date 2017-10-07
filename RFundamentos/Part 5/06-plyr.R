# Split-Apply-Combine - plyr

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap05")
getwd()

# Instalando os pacotes
install.packages("plyr")
install.packages("gapminder")
# https://www.gapminder.org

library(plyr)
library(gapminder)

?ddply
# Split-Apply-Combine
df <- ddply(gapminder, ~ continent, 
            summarize, 
            max_le = max(lifeExp))
str(df)
head(df)
levels(df$continent)

# Split-Apply-Combine
ddply(gapminder, ~ continent, 
      summarize, 
      n_uniq_countries = length(unique(country)))

ddply(gapminder, ~ continent, 
      function(x) c(n_uniq_countries = length(unique(x$country))))

ddply(gapminder, ~ continent, 
      summarize,
      min = min(lifeExp), 
      max = max(lifeExp),
      median = median(gdpPercap))


# Usando um dataset do ggplot
library(ggplot2)
data(mpg)
str(mpg)
?mpg

# Trabalhando com um subset do dataset
data <- mpg[,c(1,7:9)]
str(data)


# Sumarizando e Agregando Dados
ddply(data, .(manufacturer), 
      summarize, 
      avgcty = mean(cty))

# Várias funções em uma única chamada
ddply(data, .(manufacturer), 
      summarize, 
      avgcty = mean(cty), 
      sdcty = sd(cty), 
      maxhwy = max(hwy))

# Sumarizando os dados pela combinação de variáveis/fatores
ddply(data, .(manufacturer, drv), 
      summarize, 
      avgcty = mean(cty), 
      sdcty = sd(cty),
      maxhwy = max(hwy))

# *** Obs ***
# Os pacotes reshape/reshape2 são formas elegantes de agrupar 
# diversas variáveis ao mesmo tempo

# Perceba a diferença entre summarize e transform
ddply(data, .(drv), summarize, avgcty = mean(cty))
ddply(data, .(drv), transform, avgcty = mean(cty))



