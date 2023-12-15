# ------------------------------------------------------------------------------
# Script to load a table of AI expenditures from 2017 to 2021, by category, from
# https://ourworldindata.org/artificial-intelligence
# Practice with changing column names and extracting columns.
# Daniel Zhang, Nestor Maslej, Erik Brynjolfsson, John Etchemendy, Terah Lyons, 
# James Manyika, Helen Ngo, Juan Carlos Niebles, Michael Sellitto, Ellie Sakhaee, 
# Yoav Shoham, Jack Clark, and Raymond Perrault, “The AI Index 2022 Annual 
# Report,” AI Index Steering Committee, Stanford Institute for Human-Centered AI, 
# Stanford University, March 2022.
# ------------------------------------------------------------------------------

# Import the tidyverse.
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# Read the table from CSV, changing column names.
ai_data <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv",
           skip = 1,
           col_names = c("Entity", "Code", "Year", "Invest"))
View(ai_data)

# Remove the Total rows.
ai_data_categories <- ai_data |> filter(Entity != "Total")
View(ai_data_categories)

# Create a tibble of summary statistics over all AI spending.
spending_summary <- ai_data_categories |> summarize(Mean = mean(Invest), Min = min(Invest),
                                                     Max = max(Invest))
View(spending_summary)


# Group by year and create a tibble of summary statistics over all AI spending by year.
ai_grouped_tib <- ai_data_categories |> group_by(Year)
spending_summary_by_year <- ai_grouped_tib |> summarize(Mean = mean(Invest), Min = min(Invest),Max = max(Invest))


# Group by Entity and create a tibble of summary statistics over all AI spending by Entity
ai_grouped_tib_entity <- ai_data_categories |> group_by(Entity)
spending_summary_by_entity <- ai_grouped_tib_entity |> 
  summarize(Mean = mean(Invest), Min = min(Invest),Max = max(Invest)) |>
  arrange(Max)
View(spending_summary_by_entity)
