# ------------------------------------------------------------------------------
# The CIRights data set
# Mark, Skip and Cingranelli, David and Filippov, Mikhail and Richards, David L., 
# The CIRIGHTS Data Project Scoring Manual V2.11.06.23 (November 6, 2023). 
# Available at SSRN: https://ssrn.com/abstract=4625036 or http://dx.doi.org/10.2139/ssrn.4625036
# Retrieved from
# https://cirights.com/
# To use this script, please download the data and save as a csv file
# called cirights.csv.
# ------------------------------------------------------------------------------

# Purrr summary from
# https://www.rebeccabarter.com/blog/2019-08-19_purrr
# map(.x, .f) is the main mapping function and returns a list
# map_df(.x, .f) returns a data frame
# map_dbl(.x, .f) returns a numeric (double) vector
# map_chr(.x, .f) returns a character vector
# map_lgl(.x, .f) returns a logical vector

if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# Read in the Civil Rights table.
# Read the table from CSV.
civil_rights <- 
  read_csv("cirights.csv")
View(civil_rights)

# Create a table for just Canada.
canada_data <- civil_rights |> filter(country=="Canada") 
View(canada_data)

# ------------------------------------------------------------------------------
# map_dbl example, vector input
# Map one column of numeric values (one vector)
# And return the vector

# Write a function that takes a single numeric (vector of length 1) and
# returns a single numeric
double <- function(value) {
  value * 2
}

# Use map_dbl to double the speech column of the canada_data df.
double_speech <- canada_data$speech |> map_dbl(double)


# ------------------------------------------------------------------------------
# map_dbl example, dataframe input
# Map a dataframe
# and return a numeric vector

# Write a function that takes a dataframe column (vector)
# and returns the mean of the vector.
mean_average <- function(df_col) {
  mean(df_col)
}

# Use map_dbl to create a numeric vector of means of the df columns.
means <- canada_data |> select(-country) |> map_dbl(mean_average)


# ------------------------------------------------------------------------------
# map_df example, vector input

# Break three years out of the data and store as separate
# dataframes to illustrate map_df.
civil_rights |> filter(year == 2019) |>
  write.csv(file = "cirights_2019.csv", row.names = FALSE)
civil_rights |> filter(year == 2020) |>
  write.csv(file = "cirights_2020.csv", row.names = FALSE)
civil_rights |> filter(year == 2021) |>
  write.csv(file = "cirights_2021.csv", row.names = FALSE)

# Create a list of filenames.
filenames <- c("cirights_2019.csv", "cirights_2020.csv", "cirights_2021.csv")

# A function to read a csv file and return the dataframe, so
# the input is the filename.
read_csv_to_df <- function(filename) {
  read_csv(filename)
}

# Use map_df to read a vector of filesnames into one dataframe.
cirights_2019_to_2021 <- filenames |> map_df(read_csv_to_df)
View(cirights_2019_to_2021)

# ------------------------------------------------------------------------------
# map_df example, list of dataframes input


# Another example of map_df -- create a summary of countries
# and combine into a dataframe.

# Create a list of data for four countries, just numeric values.
european_countries <- list(civil_rights |> filter(country=="Norway") |> select(-country),
                           civil_rights |> filter(country=="Sweden") |> select(-country),
                           civil_rights |> filter(country=="France") |> select(-country),
                           civil_rights |> filter(country=="Italy") |> select(-country) )

# Write a function to invoke the mean_average function on each column of the
# dataframe, returning a vector of numeric values.
summarize_columns <- function(df) {
  map_dbl(df, mean_average)
}


# Assemble the vectors into rows of a dataframe using map_df.
summary_europe <- european_countries |> map_df(summarize_columns)
View(summary_europe)


