library(tm)
library(devtools)
library(jiebaRD)
library(jiebaR)  
library(RColorBrewer)
library(wordcloud)

#> Keywords
keys = worker("keywords", topn = 5)
keys <= "tianjinfood_comments.txt"

#> Text segmentation
seg = worker()
seg <= "tianjinfood_comments.txt" 

segdir <- file.path("Quantitative Data Analysis/comments", "segmented")

segtext <- Corpus(DirSource(segdir, encoding="UTF-8"))
summary(segtext)
inspect(segtext[2])

#> Calculate word frequency
st.dtm <- DocumentTermMatrix(segtext)
st.freq <- colSums(as.matrix(st.dtm))
inspect(st.freq)

st.dtms <- removeSparseTerms(st.dtm, 0.1) 
st.freqs <- colSums(as.matrix(st.dtms))
inspect(st.freqs)

#> Create wordcloud
set.seed(166)
wordcloud(names(st.freqs), st.freqs, max.words = 50, colors = brewer.pal(6, "Dark2"), random.order=F)
