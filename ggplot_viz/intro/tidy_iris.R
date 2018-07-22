# tidy iris
str(iris)

iris.tidy <- iris %>% 
  rowid_to_column("Flower") %>% 
  gather(var, Value, -Species, -Flower) %>% 
  separate(var, into = c("Part", "Measure"), "\\.")

iris.wide <- iris.tidy %>% 
  spread(Measure, Value)


# Recplicate graph on download.png
ggplot(iris.tidy, aes(Species, Value, col = Part)) + 
  geom_jitter() + 
  facet_grid(. ~ Measure)
