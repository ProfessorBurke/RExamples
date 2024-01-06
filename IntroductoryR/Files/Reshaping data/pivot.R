# ------------------------------------------------------------------------------
# Table of AI expenditures from 2017 to 2021, by category, from
# https://ourworldindata.org/artificial-intelligence
# 
# Daniel Zhang, Nestor Maslej, Erik Brynjolfsson, John Etchemendy, Terah Lyons, 
# James Manyika, Helen Ngo, Juan Carlos Niebles, Michael Sellitto, Ellie Sakhaee, 
# Yoav Shoham, Jack Clark, and Raymond Perrault, “The AI Index 2022 Annual 
# Report,” AI Index Steering Committee, Stanford Institute for Human-Centered AI, 
# Stanford University, March 2022.
#
# World Happiness Report
# https://www.kaggle.com/datasets/unsdsn/world-happiness
#
# Examples of pivot_wider and pivot_longer, joins.
# ------------------------------------------------------------------------------

# Import the tidyverse.
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
if (!require(readxl)) install.packages("readxl")
library(readxl)
if (!require(janitor)) install.packages("janitor")
library(janitor)

# Read the table from CSV, changing column names.
ai_data <- 
  read_csv("private-investment-in-artificial-intelligence-by-focus-area.csv",
           skip = 1,
           col_names = c("Entity", "Code", "Year", "Invest")) |> select(-Code)
View(ai_data)

# This code creates the untidy example of the ai_invest tibble.
not_tidy <- pivot_wider(ai_data, names_from = Year, values_from = Invest)
View(not_tidy)

# Use pivot_longer to put not_tidy into tidy format.
retidied <- not_tidy |> pivot_longer(c("2017", "2018", "2019", "2020", "2021"),
                                     names_to = "Year", values_to = "Invest",
                                     names_transform = as.numeric)
View(retidied)

# The World Happiness Report is composed of separate tables for every year.
# Read them in and put the names in the format of lowercase letters with words
# separated by underscores, then mutate each table to add a column for the year.
whr_2015 <- read_xlsx("WHR_2015.xlsx") |> clean_names() |> mutate(year = 2015)
whr_2016 <- read_xlsx("WHR_2016.xlsx") |> clean_names() |> mutate(year = 2016)
whr_2017 <- read_xlsx("WHR_2017.xlsx") |> clean_names() |> mutate(year = 2017)


# Combine the tables with full_join.
whr_all <- full_join(whr_2015, whr_2016) |> full_join(whr_2017)
View(whr_all)

# If you want to select only the columns from a dataframe that are found in all
# of the dataframes, you can use code like this (to modify the whr_2015 dataframe).
whr_2015_common <- select(whr_2015, intersect(colnames(whr_2017),intersect(colnames(whr_2015), colnames(whr_2016))))


