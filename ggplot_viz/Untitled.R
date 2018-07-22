
library(tibble)

budget <- function(x) 40 - (1 * x)
utility <- function(x, good_x, good_y, adj = 0) sqrt(good_x * good_y)^2 / x + adj
budget_new_kink <- function(x) ifelse(x <= 14, budget(0), budget(x) + 14) 

consumption <- tribble(
  ~x, ~y, ~label,
  20, 20, "A",
  23, budget_new_kink(23), "B"
)

effects <- data_frame(x_start = c(filter(consumption, label =="A") %>% pull(x)),
                      x_end   = c(filter(consumption, label == "B") %>% pull(x)),
                      label = c("IE"),
                      y=c(12))

ggplot(data = consumption, aes(x=x, y=y)) + 
  stat_function(data = data_frame(x=0:50), inherit.aes = FALSE,
                aes(x = x, color = "Original budget", size = "Original budget"),
                fun = budget) +
  stat_function(data = data_frame(x=0:70), inherit.aes = FALSE,
                aes(x = x, color="New budget", size = "New budget"),
                fun = budget_new_kink) + 
  stat_function(data = data_frame(x=1:25), inherit.aes = FALSE,
                aes(x = x, color = "Original indifference", size = "Original indifference"),
                fun = utility, args = list(good_x = 20, good_y = 20)) + 
  stat_function(data = data_frame(x=1:25), inherit.aes = FALSE,
                aes(x = x, color = "New indifference", size = "New indifference"),
                fun = utility, args = list(good_x = 17.85, good_y = 31, adj = 7)) + 
  # geom_segment(aes(xend = x, yend = 0),
  #              size = 0.5, color = nord_yellow, linetype = "dashed") + 
  # geom_segment(aes(xend = 0, yend = y),
  #              size = 0.5, color = nord_yellow, linetype = "dashed") +
  NULL
