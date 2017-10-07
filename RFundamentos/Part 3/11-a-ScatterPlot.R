# Scatterplots

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

# Define os dados
set.seed(67)
x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)


# Cria o Plot
plot(x, y, col = 123, pch = 10, main = "Multi Scatterplot",
     col.main = "red", cex.main = 1.5, xlab = "indep", 
     ylab = "depend")

# Adiciona outros dados 
points(z, t, col = "blue", pch = 4)

# Adiciona outros dados 
points(y, t, col = 777, pch = 9)

# Cria legenda
legend(-6,5.9, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10,4,9),
       cex = 0.65, bty = "n")




