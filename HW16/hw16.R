web <- 'https://thefourthrevolution.org/wordpress/'
library(dplyr); library(readr); library(tidytext)

tokens <- tibble(text=read_lines(web)) %>% unnest_tokens(word, text, format = 'html')

wcorp <- tokens %>% anti_join(stop_words) %>% count(word, sort = T)

library(wordcloud)
library(RColorBrewer)
wcorp %>%
  with(wordcloud(word,n,scale=c(3,0.5),min.freq = 6,
                 colors=brewer.pal(8,"Dark2"),random.order=FALSE))

library(ggplot2)
wcorp[wcorp$n > 5,] %>%
  mutate(word=reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_bar(stat="identity",fill="deepskyblue") + 
  theme_bw() +
  coord_flip()
