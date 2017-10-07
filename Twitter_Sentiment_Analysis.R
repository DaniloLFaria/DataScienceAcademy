install.packages(c("twitteR", "stringr", "plyr", "Rstem", "ggmap", "xlsx"))
install.packages("https://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.2.tar.gz", repos = NULL)

#Load packages
library(twitteR)
library(stringr)
library(plyr)
library(Rstem)
library(sentiment)
library(ggmap)
library(xlsx)

#variaveis de autenticação
api_key <- ""
api_secret <- ""
access_token <- ""
access_token_secret <- ""

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#criar DataSet com os estados (hardcode pois isso não mudara)
locations <- cbind(
                     c('Amazonas', 'Bahia', 'Brasília', 'Ceará', 'Espírito Santo', 'Goiás', 'Maranhão', 'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Pará', 'Paraíba', 'Paraná', 'Pernambuco', 'Piauí', 'Rio de Janeiro', 'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima', 'Santa Catarina', 'São Paulo', 'Sergipe', 'Tocantins')
                    ,c('AM', 'BA', 'DF', 'CE',  'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO')
                  )

locations <- as.data.frame(locations)
names(locations) <- c("state", "shortName")
locations$state <- as.character(locations$state)
locations$findName <- sapply(locations$state, remove.acentos)
locations$latlong <- sapply(locations$findName, getLatLog)
locations$latitude <- sapply(locations$latlong, function(x){ unlist(strsplit(x, ","))[1] })
locations$longitude <- sapply(locations$latlong, function(x){ unlist(strsplit(x, ","))[2] })

#busca por tweets
tweets <- data.frame()

search <- c("#politica","#política")

for(s in search)
{
  for (l in 1:nrow(locations))
  {
    tw = searchTwitter(s, n=1000 , geocode=paste(locations[l,]$latlong, '60000km', sep = ','), since='2017/01/01', lang="pt")#since=format(Sys.Date() - 3, "%Y/%m/%d"), lang="pt")
    
    if (length(tw) > 0)
    {
      tw <- twListToDF(tw)
      tw$state <- locations[l,]$state
      tw$shortName <- locations[l,]$shortName
      tw$latitude <- locations[l,]$latitude
      tw$longitude <- locations[l,]$longitude
      tweets=rbind(tw, tweets)
    }
  }
}

#separa as colunas mais relevantes para a analise
tweets_df <- as.data.frame(tweets[, c("text", "state" , "shortName", "created", "screenName", "latitude", "longitude")])

#tratamento de texto 
tweets_df$text <- sapply(tweets_df$text, clean.text)

tweets_df$day <- sapply(tweets_df$created, function(x) { format(as.Date(x), "%d") } )
tweets_df$month <- sapply(tweets_df$created, function(x) { format(as.Date(x), "%B") } )
tweets_df$year <- sapply(tweets_df$created, function(x) { format(as.Date(x), "%Y") } )
tweets_df$date <- sapply(tweets_df$created, function(x) { format(as.Date(x), "%Y/%m/%d") } )

#classificação de emoção (anger, disgust, fear, joy, sadness, surprise) Naive bayes
tweets_df$emotion <- classify_emotion(tweets_df$text, algorithm = "bayes", prior = 1.0)[,7]
tweets_df$emotion <- sapply(tweets_df$emotion, is.unknown)

#Classificação de polaridade (positive, neutral, negative)
tweets_df <- cbind(tweets_df, classify_polarity(tweets_df$text, algorithm = "bayes"))
tweets_df$posNeg <- sapply(tweets_df$BEST_FIT, function(x){ifelse(as.character(x) == "positive", 1, 0)})

#criar aquivo excel
write.xlsx(tweets_df, file = "tweets_sentiment.xlsx", row.names = FALSE, sheetName = "tweets")

#frequeência de palavras
Corpus <- Corpus(VectorSource(tweets_df$text))
Corpus <- tm_map(Corpus, removeNumbers)
Corpus <- tm_map(Corpus, removeWords, stopwords(kind = 'pt'))
Corpus <- tm_map(Corpus, removePunctuation)
Corpus <- tm_map(Corpus, stripWhitespace)
Corpus <- tm_map(Corpus, content_transformer(tolower))

termmatrix <- TermDocumentMatrix(Corpus)
matrix <- as.matrix(termmatrix)

sort <- sort(rowSums(matrix), decreasing=TRUE)
twfrequency <- data.frame(palavra = names(sort), freq = sort)

#Arquivo excel com frequência de palavras
write.xlsx(head(twfrequency, n=20), file = "frequency_words.xlsx", row.names = FALSE)

#tweets by emotion
#ggplot(tweets_df, aes(x = emotion)) +
#  geom_bar(aes(y = ..count.., fill = emotion)) +
#  scale_fill_brewer(palette = "Dark2") +
#  labs(x = "Emotions", y = "Qtd Tweets")

#tweets by sentiment
# ggplot(tweets_df, aes(x = BEST_FIT)) +
#   geom_bar(aes(y = ..count.., fill = BEST_FIT)) +
#   scale_fill_brewer(palette = "Dark2") +
#   labs(x = "Sentiment", y = "Qtd Tweets")

# ggplot(head(twfrequency, n=20), aes(x=palavra, y=freq)) + 
#   geom_bar(colour="black", fill="#DD8888", width=.8, stat="identity")
# 
# barplot(twfrequency[1:20,]$freq, las = 2, names.arg = twfrequency[1:20,]$palavra,
#         col ="lightblue", main ="Most frequent words",
#        ylab = "Word frequencies")

