library(tm)
library(devtools)
library(jiebaRD)
library(jiebaR)  #! Check out "http://qinwenfeng.com/jiebaR/" for more information
library(RColorBrewer)
library(wordcloud)

setwd("C:\\Users\\Gaoyuan\\Documents\\Quantitative Data Analysis\\comments")

#> Keywords
keys = worker("keywords", topn = 5)
keys<="tianjinfood_comments.txt"

#> Text segmentation
seg = worker()
seg<= "tianjinfood_comments.txt"  # NOT "<-".
#equivalent to:  segment("ST_excerpt.txt" , cutter)

segdir<-file.path("C:\\Users\\Gaoyuan\\Documents\\Quantitative Data Analysis\\comments", "segmented")

segtext<-Corpus(DirSource(segdir, encoding="UTF-8"))
summary(segtext)
inspect(segtext[2])

st.dtm<-DocumentTermMatrix(segtext)
st.freq<-colSums(as.matrix(st.dtm))
inspect(st.freq)

st.dtms<-removeSparseTerms(st.dtm, 0.1)  # This makes a matrix that is 10% empty space, maximum.
st.freqs<-colSums(as.matrix(st.dtms))
inspect(st.freqs)

set.seed(166)
wordcloud(names(st.freqs), st.freqs, max.words = 50, colors = brewer.pal(6, "Dark2"), random.order=F)
