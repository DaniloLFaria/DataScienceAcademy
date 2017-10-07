clean.text <- function(txt)
{
  
  txt = gsub("&amp", "", txt)
  txt = gsub("(RT|via)((?:\b\\W*@\\w+)+)", "", txt)
  txt = gsub("[[:punct:]]", "", txt)
  txt = gsub("[[:digit:]]", "", txt)
  txt = gsub("^[:alnum:]]", "", txt)
  txt = gsub("[ t]{2,}", "", txt)
  txt = gsub("^\\s+|\\s+$", "", txt)
  txt = gsub('https://t.co/[A-Za-z\\d]+|&amp;', "", txt)
  txt = gsub("http\\w+", "", txt)
  txt = gsub("\n", " ", txt)
  txt = gsub("feedly", "", txt)
  
  try.tolower = function(x)
  {
    y = NA
    try_error = tryCatch(tolower(x), error=function(e) e)
    if (!inherits(try_error, "error"))
      y = tolower(x)
    
    return(y)
  }
  
  txt = sapply(txt, try.tolower)
  txt = txt[txt != ""]
  names(txt) = NULL
  return(txt)
}

remove.acentos <- function(x)
{
  x <- gsub("ã", "a", x)
  x <- gsub("á", "a", x)
  x <- gsub("à", "a", x)
  x <- gsub("â", "a", x)
  x <- gsub("é", "e", x)
  x <- gsub("õ", "o", x)
  x <- gsub("ô", "o", x)
  x <- gsub("í", "i", x)
  x <- gsub("ú", "u", x)
  return(x)
}

try.error = function(x)
{
  y = NA
  try_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(try_error, "error"))
    y = tolower(x)
  return(y)
}

is.unknown = function(x)
{
  if(is.na(x))
    return('unknown')
  else
    return(x)
}

getLatLog <- function(x)
{
  df <- geocode(x, source = "google")
  return(paste(df$lat,df$lon,sep=","))
}