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

library(readr)

#' Remove a column from a dataframe.
#'
#' @param df The dataframe that might have the column to be removed.
#' @param colname The name of the column to be removed.
#'
#' @return The dataframe with the column removed.
remove_column <- function(df, colname) {
  if (colname %in% colnames(df)) {
    i <- which (colnames(df) == colname)
    df <- df[, -i]
  }
  df
}

# Create a list of paths to the data files.
paths <- list()
i <- 1
for (year in seq(2017, 2021)) {
  paths[[i]] <- paste("data/AI_Data_", year, ".csv", sep="")
  i <- i + 1
}

# Create a list of dataframes.
tables <- list()
i <- 1
for (year in seq(2017, 2021)) {
  df <- read_csv(paste("data/AI_Data_", year, ".csv", sep=""))
  df <- remove_column(df, "Code")
  tables[[i]] <- df
  i <- i + 1
}

# Create a list of dataframes by getting files from the operating system.
filenames <- list.files("data")
tables2 <- list()
i <- 1
for (filename in filenames) {
  df <- read_csv(paste("data/", filename, sep=""))
  df <- remove_column(df, "Code")
  tables2[[i]] <- df
  i <- i + 1
}

# Use lapply to create the list of tables.
tables3 <- lapply(paths, read_csv)
tables4 <- lapply(tables3, remove_column, colname = "Code")
