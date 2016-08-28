setwd("C:/GitHub/DataScienceAcademy/DataScienceAcademy/RFundamentos/Part 2")
getwd()

install.packages("readr")
install.packages("data.table")
install.packages("ggplot2")
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)


#system.time(df_teste1 <- read.csv2("TemperaturasGlobais.csv"))

#system.time(df_teste1 <- read.table("TemperaturasGlobais.csv"))

?fread()
system.time(df <- fread("TemperaturasGlobais.csv"))


cidadesBrasil <- subset(df, Country == "Brazil")
#eliminar os valores NA do data frame
cidadesBrasil <- na.omit(cidadesBrasil)
#numero de linhas
nrow(cidadesBrasil)
#dimensoes do data frame
dim(cidadesBrasil)

#tratando as datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt, format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)


plm = subset(cidadesBrasil, City == "Palmas")
plm = subset(plm, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

crt = subset(cidadesBrasil, City == "Curituba")
crt = subset(crt, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))

recf = subset(cidadesBrasil, City == "Recife")
recf = subset(recf, Year %in% c(1796, 1846, 1896, 1946, 1996, 2012))


#Criando os plots e armazenando em variáveis
p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
   geom_smooth(se = FALSE, fill = NA, size = 2) +
   theme_light(base_size = 20) +
   xlab("Mês") +
   ylab("Temperatura") +
   scale_color_discrete("") +
   ggtitle("Temperaturas Palmas") +
   theme(plot.title = element_text(size = 10))

p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura") +
  scale_color_discrete("") +
  ggtitle("Temperaturas Curitiba") +
  theme(plot.title = element_text(size = 10))

p_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE, fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês") +
  ylab("Temperatura") +
  scale_color_discrete("") +
  ggtitle("Temperaturas Recife") +
  theme(plot.title = element_text(size=10))


p_plm

  








