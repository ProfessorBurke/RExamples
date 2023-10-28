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

# Read the table from CSV, changing column names.
library(readr)
ai_invest <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv",
           skip = 1,
           col_names = c("Entity", "Code", "Year", "Invest"))
View(ai_invest)

# Print a message if num is greater than one billion and a different message otherwise.
num <- ai_invest[1, 4]
if (num > 1000000000) {
  print("The value is greater than one billion.")
} else {
  print("The value is not greater than one billion.")
}

# Do the same thing for a different value of num.
num <- ai_invest[7, 4]
if (num > 1000000000) {
  print("The value is greater than one billion.")
} else {
  print("The value is not greater than one billion.")
}


# Load in two tables for 2020 and 2021 AI Data.
ai_2020 <- 
  read_csv("AI_Data_2020.csv")
View(ai_2020)
if ("Code" %in% colnames(ai_2020)) {
  i <- which (colnames(ai_2020) == "Code")
  ai_2020 <- ai_2020[, -i]
}

ai_2021 <- 
  read_csv("AI_Data_2021.csv")
View(ai_2021)
if ("Code" %in% colnames(ai_2021)) {
  ai_2021 <- ai_2021[, -2]
}

# Demonstrate the greater than one billion expression on the entire ai_invest dataframe,
# using the ternary ifelse operator.
over_billion <- ifelse(ai_invest[4] > 1000000000, "BIG", "SMALL")
ai_invest_categorized <- ai_invest
ai_invest_categorized[,"SIZE"] <- ifelse(ai_invest[4] > 1000000000, "BIG", "SMALL")
