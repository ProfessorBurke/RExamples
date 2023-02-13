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

# Extract a single row.
row1 <- ai_invest[1,]

# Extract a subset of rows using a vector.
ag_tech <- ai_invest[1:5,]

# Extract a subset of rows using a vector of non-contiguous indices.
noncontig <- ai_invest[c(3,6,8),]

# Extract a subset of ag_tech using a logical vector.
some_ag_tech <- ag_tech[c(T,F,T,F,T),]

# Create a vector of logical values using a condition.
is_year_2017 <- ai_invest$Year == 2017

# Subset the table using a logical condition.
ai_2017 <- ai_invest[ai_invest$Year == 2017,]

# Two ways to subset rows and columns.
include_indexing <- ai_invest[1:5,c(1, 3, 4)]
exclude_indexing <- ai_invest[1:5,-2]

# Make another subset of the original df.
av <- ai_invest[6:10,]

# Combine the two subsets into one table.
ag_and_av <- rbind(av, ag_tech)

 