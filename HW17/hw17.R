library(gutenbergr)
oliver <- gutenberg_download(730)

library(dplyr); library(tidytext)
tm_oliver <- oliver %>% unnest_tokens(word, text, token='ngrams', n=2) %>% anti_join(stop_words)
tm_oliver

library(tidyr)
bg_oliver <- tm_oliver %>% separate(word, c('word1', 'word2'), sep = " ")

filter_bg <- bg_oliver %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)

head(filter_bg, 3)

count_bg <- filter_bg %>% count(word1, word2, sort=T)

library(igraph)
graph_bg <- count_bg %>% filter(n > 4) %>% graph_from_data_frame() 
graph_bg

library(ggraph)
ar <- grid::arrow(type="closed", length=unit(.1,"inches"))

ggraph(graph_bg,layout='fr') +
  geom_edge_link(aes(edge_alpha=n), show.legend=FALSE,
                 arrow=ar, end_cap=circle(.07,"inches")) +
  geom_node_point(color="navyblue", size=2) +
  geom_node_text(aes(label=name), vjust=1, hjust=1) +
  theme_void()

count_bg %>%
  filter(n > 4) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha=n,edge_width=n),
                 edge_colour="cyan4") +
  geom_node_point(color="navyblue", size = 2) +
  geom_node_text(aes(label = name), repel = TRUE,
                 point.padding = unit(0.2, "lines")) +
  theme_void()

library(tidytext)
AFINN <- get_sentiments("afinn")
head(AFINN)

nots <- tm_oliver %>%
  separate(word, c("word1","word2"), sep=" ") %>%
  filter(word1 %in% c('no', 'not', 'never', 'neither')) %>%
  inner_join(AFINN, by = c(word2 = "word")) %>%
  count(word2, score, sort = TRUE)
nots

library(ggplot2)
win.graph()
nots %>% mutate(contribution = n*score) %>% arrange(desc(abs(contribution))) %>% ggplot(aes(reorder(word2, contribution), n*score, fill=n*score > 0)) + geom_bar(stat = 'identity', show.legend = F) + xlab("Words preceded by negate word") + ylab("Sentiment score x Number of occirrances") + coord_flip()


