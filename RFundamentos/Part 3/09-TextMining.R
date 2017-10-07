# Text Mining

# ***** Esta é a versão 2.0 deste script, atualizado em 18/08/2017 *****
# ***** Esse script pode ser executado nas versões 3.3.1, 3.3.2, 3.3.3 e 3.4.0 da linguagem R *****
# ***** Recomendamos a utilização da versão 3.4.0 da linguagem R *****

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
setwd("~/Dropbox/DSA/BigDataAnalytics-R-Azure/Cap03")
getwd()

# Exemplo 1
install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer"))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# Carregando o dataset
df <- read.csv('questoes.csv', stringsAsFactors = FALSE)
head(df)

# Criando um Corpus
dfCorpus <- Corpus(VectorSource(df$Question))
class(dfCorpus)

# Imprimindo uma linha do Corpus
dfCorpus[[1]][[1]]

# Convertendo Corpus em um documento de texto plano
# dfCorpus <- tm_map(dfCorpus, PlainTextDocument)

# Remove pontuação
dfCorpus <- tm_map(dfCorpus, removePunctuation)

# Remover palavras específicas do inglês
dfCorpus <- tm_map(dfCorpus, removeWords, stopwords('english'))

# Neste processo, várias versões de uma palavras são convertidas em uma única instância
dfCorpus <- tm_map(dfCorpus, stemDocument)

# Removendo palavras específicas
dfCorpus <- tm_map(dfCorpus, removeWords, c('the', 'this', stopwords('english')))

# Ajustando o encoding
# dfCorpus <- iconv(dfCorpus, "UTF-8")

# wordcloud
wordcloud(dfCorpus, max.words = 100, random.order = FALSE)



# Exemplo 2
install.packages("tm")  
install.package("SnowballC") 
install.packages("wordcloud") 
install.packages("RColorBrewer") 

library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Lendo o arquivo
arquivo <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
texto <- readLines(arquivo)

# Carregando os dados como Corpus
docs <- Corpus(VectorSource(texto))

# Pré-processamento
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Converte o texto para minúsculo
docs <- tm_map(docs, content_transformer(tolower))

# Remove números
docs <- tm_map(docs, removeNumbers)

# Remove as palavras mais comuns do idioma inglês
docs <- tm_map(docs, removeWords, stopwords("english"))

# Você pode definir um vetor de palavras (stopwords) a serem removidas do texto
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 

# Remove pontuação
docs <- tm_map(docs, removePunctuation)

# Elimina espaços extras
docs <- tm_map(docs, stripWhitespace)

# Text stemming
docs <- tm_map(docs, stemDocument)


dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v), freq = v)
head(d, 10)

# wordcloud
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words = 200, random.order = FALSE, rot.per = 0.35, 
          colors = brewer.pal(8, "Dark2"))


# Tabela de frequência
findFreqTerms(dtm, lowfreq = 4)
findAssocs(dtm, terms = "freedom", corlimit = 0.3)
head(d, 10)

# Gráficos de barras com as palavras mais frequentes
barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")


