# Install Plotly 
install.packages("plotly")
library("plotly")

# Use the plot_ly function to test it out and see that it is working
# create a variable and pass in the plot_ly function that takes in 
# the data midwest, sets the x to ~percollege, the color to ~state 
# and the type to "box" 
p <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")

# Make two vectors of numbers between 1 and 10, with each vector having 10 numbers in it
x <- c(2, 5, 1, 7, 8, 4, 8, 5, 6, 3)
y <- c(6, 2, 1, 4, 7, 8, 9, 0, 5, 4)

# create a data frame of the two vectors 
plot.data <- data.frame(x, y)

# now create a basic scatterplot using the data frame you just created, passing it into 
# a variable
basic.scatterplot <- plot_ly(data = plot.data, x = x, y = y)

# Call your variable and enjoy your awesome plot! 
basic.scatterplot

# Now create a new variable styled.scatterplot. Using the same data and scatterplot
# as from earlier, but you are going to change the markers.  Make it so the 
# markers are size 10, of a color of your choice.  Finally change the boarder,
# of the markers to a differnet color with a widthe of 2
styled.scatterplot <- plot_ly(data = plot.data, x = x, y = y, 
  marker = list(size = 10,
    color = 'rgba(255, 182, 193, .9)',
    line = list(color = 'rgba(152, 0, 0, .8)',
          width = 2)))%>% 
  layout(title = 'Styled Scatter',
         yaxis = list(zeroline = FALSE),
         xaxis = list(zeroline = FALSE))

# Call the style.scatterplot variable and see what has changed. Finally add
# add a pipe operator and use the layout function to add a title and set the
# x and y axis to have zeroline = FALSE 


d <- diamonds[sample(nrow(diamonds), 1000), ]
p <- plot_ly(d, x = ~carat, y = ~price, z = ~depth) %>%
  add_markers(text = ~paste("Clarity: ", clarity))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = plotly_POST(p, filename="scatter3d/text")
chart_link







