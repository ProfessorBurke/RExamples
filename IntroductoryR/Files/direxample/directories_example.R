# ------------------------------------------------------------------------------
# Working directories example.
#
# In this example, this script is in a folder called directories. 
# The structure of the folder is:
# direxample
# |--directories_example.R
# |--private-investment-in-artificial-intelligence-by-focus-area.csv
# |--data
#    |--AI_Data_2017.csv
#    |--AI_Data_2018.csv
#
# AI expenditures from 2017 to 2021, by category, from
# https://ourworldindata.org/artificial-intelligence
# Daniel Zhang, Nestor Maslej, Erik Brynjolfsson, John Etchemendy, Terah Lyons, 
# James Manyika, Helen Ngo, Juan Carlos Niebles, Michael Sellitto, Ellie Sakhaee, 
# Yoav Shoham, Jack Clark, and Raymond Perrault, “The AI Index 2022 Annual 
# Report,” AI Index Steering Committee, Stanford Institute for Human-Centered AI, 
# Stanford University, March 2022.
# ------------------------------------------------------------------------------

# Import the tidyverse.
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# Read the AI table from CSV, changing column names, and view.
ai_data <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv",
           skip = 1,
           col_names = c("Entity", "Code", "Year", "Invest"))
View(ai_data)

# Comparing two paths to see how they relate -- what the relative path from
# one to the other is.
# C:\Users\Maggie\Desktop\folder\direxample
# C:\Users\Maggie\Desktop\folder\direxample\data

# Read a file in the data folder using a relative path.
ai_2017 <- read_csv("data/AI_Data_2017.csv")
View(ai_2017)

# Use file.path to construct the relative path.
path <- file.path("data", "AI_Data_2017.csv")
ai_2017 <- read_csv(path)
View(ai_2017)


# We can create a path that moves up two directorys with this.
# This is a fake path to illustrate how to move up to parent directories.
path_up2 <- file.path("..", "..", "file.csv")


