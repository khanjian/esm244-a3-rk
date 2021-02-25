# g11 <-  g1 + plot_annotation(caption = "Chloropleth of counts of inland oil spills in 2008 in California",
#                      title = "Number of oil spills\nwithin county")  
# g11 &  theme(plot.background = element_rect(fill = "#222222",
#                                        color = "#222222"),
#         legend.title = element_text(face = "bold", size = 12, color = "white"),
#         legend.text = element_text(face = "bold", size = 11, color = "white"),
#         legend.position = "right",
#         plot.caption = element_text(face = "bold", size = 11, color = "white"))

# g1 & theme(plot.background = element_rect(fill = "#222222",
#                                                  color = "#222222"))

#### not working ugh

# Color palette for chloropleth
chlor_palette <- c("skyblue", "steelblue", "dodgerblue", 
                   "royalblue", "blue", "navyblue")

season_1 <- str_glue("scripts/s1e0{1:6}.csv") %>% 
  map_dfr(read_csv)


test <- c("TEST", "Test", "test", "EVAN", "EvAn")

test <- as.data.frame(test)

df %>% 
  mutate(character = str_extract(test,"[A-Z']+$")) %>% 
  fill(character)

# geom_text_wordcloud_area(
#   mask = png::readPNG(system.file("extdata/hearth.png",
#     package = "ggwordcloud", mustWork = TRUE
#   )),
#   rm_outside = TRUE
# ) 




parks_network <- parks_token %>% 
  left_join(top_characters) %>% 
  drop_na(first, last, n) %>% 
  filter(!word %in% c("hey", "yeah", "gonna")) %>% 
  select(-n) %>% 
  filter(word %in% c(first, last)) %>% 
  count(word, character, sort = TRUE)


# Filter the top 10 characters with the most words
top_characters <- parks_token %>%
  filter(character != "Extra") %>% 
  count(character, sort = TRUE) %>%
  slice_max(n, n = 10) %>% 
  separate(character, c("first", "last"), remove = FALSE) %>% 
  mutate(first = str_to_lower(first)) %>% 
  mutate(last = str_to_lower(last))
