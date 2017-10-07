# Expressões Regulares

# ***** Esta é a versão 2.0 deste script, atualizado em 23/05/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

# grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
# grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
# gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

str <- c("Expressões", "regulares", "em linguagem R", 
         "permitem a busca de padrões", "e exploração de textos",
         "podemos buscar padrões em dígitos",
         "como por exemplo",
         "10992451280")

length(str)
str

# grep()
grep("ex", str, value = F)
grep("ex", str, value = T)
grep("\\d", str, value = F)
grep("\\d", str, value = T)


# grepl()
grepl("\\d+", str)
grepl("\\D", str)


# gsub
gsub("em", "|", str)
gsub("ex", "EX", str, ignore.case = T)


# sub()
sub("em", "EM", str)


# regexpr()
frase <- "Isso é uma string."
regexpr(pattern = "u", frase)


# gregexpr()
gregexpr(pattern = "u", frase)



str2 <- c("2678 é maior que 45 - @???!§$",
          "Vamos escrever 14 scripts R")

str2

# gsub()
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot]", "Q", str2)
gsub("[[:punct:]]", "", str2)
gsub("[^@]", "", str2)






