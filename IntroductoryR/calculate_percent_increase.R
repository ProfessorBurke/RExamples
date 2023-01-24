# ------------------------------------------------------------------------------
# Script to load a table of AI expenditures from 2017 to 2021, by category, from
# https://ourworldindata.org/artificial-intelligence
# Extract expenditures from 2017 and 2021 and compute the percent increase.
# Daniel Zhang, Nestor Maslej, Erik Brynjolfsson, John Etchemendy, Terah Lyons, 
# James Manyika, Helen Ngo, Juan Carlos Niebles, Michael Sellitto, Ellie Sakhaee, 
# Yoav Shoham, Jack Clark, and Raymond Perrault, “The AI Index 2022 Annual 
# Report,” AI Index Steering Committee, Stanford Institute for Human-Centered AI, 
# Stanford University, March 2022.
# ------------------------------------------------------------------------------

# Read the table from CSV.
library(readr)
ai_invest <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv")

# Extract expenditures for 2017 and 2021.
ai_2017 <- ai_invest[ai_invest$Year == 2017,]$total_private_investment_by_focus_area_inflation_adjusted
ai_2021 <- ai_invest[ai_invest$Year == 2021,]$total_private_investment_by_focus_area_inflation_adjusted

# Calculate percent change.
growth_ai <- (ai_2021 - ai_2017) / ai_2017 * 100

# Display percent change between 2017 and 2021.
print(growth_ai)