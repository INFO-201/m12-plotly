# Module 12: Plotly

## Overview
In this module, you'll start building visualizations using the Plotly API. Plotly is a visualization software that recently open-sourced it's API to JavaScript, MatLab, Python, and R, making it quite valuable to learn. Plotly graphs are fairly customizable, and (by default) have a variety of interactive methods with each chart (i.e., hover, brush to zoom, pan, etc.). Many of these events are fairly cumbersome to build programmatically, which makes a library like Plotly quite attractive.

<!-- START doctoc -->
<!-- END doctoc -->

## Resources
- [Plotly Website](https://plot.ly/)
- [Plotly R API](https://plot.ly/r/)
- [Getting Started with Plotly for R](https://plot.ly/r/getting-started/)
- [Plotly Cheatsheet](https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf)
- [Plotly book (extensive documentation)](https://cpsievert.github.io/plotly_book/)

## Getting Started
The Plotly API is an R package that you'll use to build interactive graphics. Like other open-source that we've used in this course, we'll load this API as a R package as follows:

```bash
# Install package
install.packages("plotly")

# Load library
library(plotly)
```

Then, the `plot_ly` object will be accessible to you to build graphics on your page.

## Basic Charts
One of the best ways to start building charts with Plotly is to take a look at a [basic example](https://plot.ly/r/#basic-charts) of your choice, and explore the syntax. In general, to build a Plotly object (graph) you'll pass a **dataframe** into the `plot_ly` function, then **adjust the parameters** to specify what you want to visualize. For example, here is the basic example of a scatterplot from the documentation:

```bash
# Make a scatterplot of the iris data
plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, type = "scatter")
```

The approach seems pretty straightforward -- in fact, if you exclude `type = "scatter"`, Plotly will make an educated guess about what type of plot you want (and in this case, it will in fact create a scatterplot!). The only syntax that looks a bit strange is the tilde character (`~`). In R, the tilde designates a variable as a **formula**, which was a design choice of the developers of the API.

To practice making basic charts in Plotly, see [exercise-1](exercise-1).

## Layout
While the `plot_ly` function controls the data that is being visualized, additional chart options such as _titles and axes_ are controlled by the `layout` function. The `layout` function accepts as a parameter **a plotly object**, and _manipulates that object_. Again, I think a great place to start is an example in the [documentation](https://plot.ly/r/text-and-annotations/):

```bash
# Create some data
Primates <- c('Potar monkey', 'Gorilla', 'Human', 'Rhesus monkey', 'Chimp')
Bodywt <- c(10.0, 207.0, 62.0, 6.8, 52.2)
Brainwt <- c(115, 406, 1320, 179, 440)
data <- data.frame(Primates, Bodywt, Brainwt)

# Create a plotly object
plot_ly(data, x = ~Bodywt, y = ~Brainwt, type = 'scatter',
        mode = 'text', text = ~Primates, textposition = 'middle right',
        textfont = list(color = '#000000', size = 16)) %>%
# Pass object to the layout function
        layout(title = 'Primates Brain and Body Weight',
             xaxis = list(title = 'Body Weight (kg)',
                          zeroline = TRUE,
                          range = c(0, 250)),
             yaxis = list(title = 'Brain Weight (g)',
                          range = c(0,1400)))
```
This example uses the pipe operator (`%>%`) to pass the plotly object _into_ the `layout` function as the first argument. We can then infer the structure of the other parameters, which you can read about more in the [API Documentation](https://plot.ly/r/reference/#Layout_and_layout_style_objects):

>`title`: Accepts a string variable as the plot's title.

>`xaxis`: Accepts a **named list** to describe the rendering of the xaxis. See a full list of options [here](https://plot.ly/r/reference/#layout-xaxis).

>`yaxis`: Similarly to `xaxis`, Accepts a **named list** to describe the rendering of the yaxis. See a full list of options [here](https://plot.ly/r/reference/#layout-yaxis).

These are of course not the _only_ options you can specify, though are a good start. To practice using the `layout` function in Plotly, see [exercise-2](exercise-2).
