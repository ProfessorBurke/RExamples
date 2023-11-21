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

# This code creates the untidy example of the ai_invest tibble.
not_tidy <- pivot_wider(ai_data, names_from = Year, values_from = Invest)
View(not_tidy)

# Use filter and select to create a table of over ten-billion investments in 2021,
# showing only Entity and Invest columns.
over_10bill_2021 <- filter(ai_data, Invest > 10000000000 & Year == 2021 & Entity != "Total")
two_col_10bill_2021 <- select(over_10bill_2021, Entity, Invest)

# Use mutate to add a column called InvestMillions which is the Invest column
# divided by one million -- investment in millions of dollars.
ai_invest_millions <- mutate(ai_data, InvestMillions = round(Invest / 1000000, digits = 0))
View(ai_invest_millions)

# Use the pipe command to add a column called InvestMillions, filter the
# table for the year 2021, and select only the Entity and InvestMillions columns.
invest_millions_2021 <- ai_data %>% mutate(InvestMillions = round(Invest / 1000000, digits=0)) %>% filter(Year == 2021) %>% select(Entity, InvestMillions)
View(invest_millions_2021)


