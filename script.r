library(httr)
library(devtools)
devtools::install_github("alexioannides/elasticsearchr")

ROOT = paste(getwd(),"/",sep = "")
input = read.csv(file=paste(ROOT,"nba.csv",sep = ""), header=TRUE, sep=",")
teamValue = read.csv(file=paste(ROOT,"nba_2017_team_valuations.csv",sep = ""), header=TRUE, sep=",")
input[1] = NULL

names(teamValue)
View(teamValue)

toJSON(input[1:2,], auto_unbox = T)

r <- POST(url, body = body, encode = "json")



elastic("http://localhost:9200", "nba_analytics3", "3") %index% iris

for_everything <- query('{
  "match_all": {}
}')

elastic("http://localhost:9200", "nba_analytics", "general") %search% for_everything

resp = GET("http://localhost:9200/_stats")


dt = fromJSON(content(resp,"text"))
shards = dt[[1]]
all = dt[[2]]
indices = dt[[3]]
View(indices$iris$total$docs)

length(iris)
dim(iris)
