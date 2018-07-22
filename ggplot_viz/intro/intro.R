library(ggplot2)

ggplot(mtcars, aes(factor(cyl), mpg)) + geom_point()

# Grammar of graphics

# 7 gramatical elements: data, aesthetics, geometries

# The rest are optional: facet, statistics, coordinates, theme