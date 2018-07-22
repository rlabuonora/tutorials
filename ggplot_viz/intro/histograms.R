# Histograms

# Histograms are one of the most common and intuitive ways of showing 
# distributions. In this exercise you'll use the mtcars data frame to 
# explore typical variations of simple histograms. 

ggplot(mtcars, aes(mpg)) + geom_histogram()
# .. lets you access internal data frame
ggplot(mtcars, aes(mpg, ..count..)) + geom_histogram()

ggplot(mtcars, aes(mpg, ..density..)) + geom_histogram()
# But first, some background:
# The x axis/aesthetic: The documentation for geom_histogram() states 
# the argument stat = "bin" as a default. Recall that histograms cut up 
# a continuous variable into discrete bins - thats what the stat "bin" 
# is doing. You always get 30 evenly-sized bins by default, 
# which is specified with the default argument binwidth = range/30. 
# This is a pretty good starting point if you don't know anything 
# about the variable being ploted and want to start exploring.
# 
# The y axis/aesthetic: geom_histogram() only requires one aesthetic: x. 
# But there is clearly a y axis on your plot, so where does it come from? 
# Actually, there is a variable mapped to the y aesthetic, 
# it's called ..count... When geom_histogram() executed the 
# binning statistic (see above), it not only cut up the data
# into discrete bins, but it also counted how many values are in each bin. 
# So there is an internal data frame where this information is stored. 
# The .. calls the variable count from this internal data frame. 
# This is what appears on the y aesthetic. But it gets better! 
# The density has also been calculated. This is the proportional 
# frequency of this bin in relation to the whole data set. 
# You use ..density.. to access this information.

