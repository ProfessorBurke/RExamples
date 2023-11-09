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


# Load in two tables for 2020 and 2021 AI Data and
# remove the "Code" column, if it exists, by
# invoking the remove_column function.
ai_2020 <- 
  read_csv("AI_Data_2020.csv")
ai_2020 <- remove_column(ai_2020, "Code")
View(ai_2020)

ai_2021 <- 
  read_csv("AI_Data_2021.csv")
ai_2021 <- remove_column(ai_2021, "Code")
View(ai_2021)
