# ------------------------------------------------------------------------------
# Table of AI expenditures from 2017 to 2021, by category, from
# https://ourworldindata.org/artificial-intelligence
# 
# Daniel Zhang, Nestor Maslej, Erik Brynjolfsson, John Etchemendy, Terah Lyons, 
# James Manyika, Helen Ngo, Juan Carlos Niebles, Michael Sellitto, Ellie Sakhaee, 
# Yoav Shoham, Jack Clark, and Raymond Perrault, “The AI Index 2022 Annual 
# Report,” AI Index Steering Committee, Stanford Institute for Human-Centered AI, 
# Stanford University, March 2022.
# ------------------------------------------------------------------------------

if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
if (!require(ggthemes)) install.packages("ggthemes")
library(ggthemes)

# Read the AI data.
ai_data <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv",
           skip = 1,
           col_names = c("Entity", "Code", "Year", "Invest")) |> select(-Code)
View(ai_data)

# Create a table of just the cyber spending.
ai_cyber <- ai_data |> filter(Entity == "Cybersecurity, data protection")
View(ai_cyber)

# Create a summary table of averages for all AI spending.
avg_over_time <- ai_data |> filter(Entity != "Total") |> group_by(Year) |>
  summarize(Average = mean(Invest))
View(avg_over_time)

# Create a column chart of the cyber spending by year.
# Overlay a line chart and points for the average AI spending by year.
# Add a legend using scale_fill_manual.  To do this, we put labels in 
# the aesthetics and then give fill color to the labels in scale_fill_manual.
ggplot(ai_cyber, aes(x = Year, y = Invest)) + geom_col(aes(fill = "Invest")) + 
  geom_line(data = avg_over_time, mapping = aes(x = Year, y = Average, fill = "Avg"), color = "red", size = 2) +
  geom_point(data = avg_over_time, mapping = aes(x = Year, y = Average),  size = 3) +
  labs(x = "Year",
      y = "Investment(USD)",
      title = "Spending on AI Cybersecurity by Year vs. Average AI Spending") +
  theme_economist() +
  scale_fill_manual(name = "Legend", labels = c("Average AI", "Cybersecurity AI"),
                    values = c("Avg" = "red", "Invest" = "grey")) +
  theme(legend.position = "right")


# You can create a plot object and add different layers to it
cyb_vs_avg <- ggplot(ai_cyber, aes(x = Year, y = Invest))
cyb_vs_avg + geom_line()
cyb_vs_avg + geom_col()


# This is the example of setting the shape of points in a scatterplot
# using the shape aesthetic.
# Load the iris dataset
data(iris)

# Create a scatter plot using the iris dataset
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species)) +
  geom_point() +
  labs(title = "Sepal Length vs. Sepal Width",
       x = "Sepal Length", y = "Sepal Width",
       color = "Species") 





