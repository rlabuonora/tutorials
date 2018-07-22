# Basic line plot

load("recess.rdata")

ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_line()

# Expand the following command with geom_rect() to draw the recess periods
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_rect(data = recess,
            aes(xmin = begin, xmax = end, ymin = -Inf, ymax = Inf),
            inherit.aes = FALSE, fill = "red", alpha = 0.2) +
  geom_line()


# Use gather() to move from fish.species to a tidy data frame, fish.tidy. 
# This data frame should have three columns: 
#   Year (int), Species (factor) and Capture (int).


load("fish.rdata")

my.fish.tidy <- fish.species %>% 
  gather(Species, Capture, -Year)

ggplot(my.fish.tidy, aes(Year, Capture, color = Species)) + geom_line()
