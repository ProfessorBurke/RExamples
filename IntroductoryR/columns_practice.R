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

# Read the table from CSV, original column names.
ai_invest <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv")

# Set all the column names to new literal values.
colnames(ai_invest) <- c("Entity", "Code", "Year", "Invest")

# Set one column name to a new literal value.
colnames(ai_invest)[1] <- "Focus_Area"

# Store the column names in a variable, change one, and set to those values.
cnames <- colnames(ai_invest)
cnames[2] <- "Unknown"
colnames(ai_invest) <- cnames

# To extract a single column as a vector, use one of these methods:
ai_invest$Focus_Area
ai_invest[[1]]
as.vector(ai_invest["Year"])
as.vector(ai_invest[,3])