# ------------------------------------------------------------------------------
# The CIRights data set
# Mark, Skip and Cingranelli, David and Filippov, Mikhail and Richards, David L., 
# The CIRIGHTS Data Project Scoring Manual V2.11.06.23 (November 6, 2023). 
# Available at SSRN: https://ssrn.com/abstract=4625036 or http://dx.doi.org/10.2139/ssrn.4625036
# Retrieved from
# https://cirights.com/
# To use this script, please download the data and save as a csv file
# called cirights.csv.
# 
# The apportionment table from census.gov is here:
# https://www2.census.gov/programs-surveys/decennial/2020/data/apportionment/
#   
# The brittleness data (with missing values) is here:
# https://openmv.net/info/brittleness-index
# ------------------------------------------------------------------------------

if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

if (!require(readxl)) install.packages("readxl")
library(readxl)

# Read in the Civil Rights table.
# Read the table from CSV.
civil_rights <- 
  read_csv("cirights.csv")
View(civil_rights)

# Read a table with missing values as NA in data
brittleness_index <- read_csv("brittleness-index.csv")
View(brittleness_index)

# Read a table with missing values as "none" in data
# Note columns with "none" read in as chr type
brittleness_index_none <- read_csv("brittleness-index-none.csv")
View(brittleness_index_none)

# Read a table with missing values as "none" in data
# Make sure "none" comes in as NA
brittleness_index_none <- read_csv("brittleness-index-none.csv", na = c("", "NA", "none"))
View(brittleness_index_none)

# Read the apportionment table, which has extra rows at the top
# and the bottom.
apportionment <- read_xlsx("apportionment-2020-table01.xlsx")
View(apportionment)

# Read the apportionment table, which has extra rows at the top
# and the bottom, using arguments to skip those rows.
apportionment <- read_xlsx("apportionment-2020-table01.xlsx", skip = 3, n_max = 50)
View(apportionment)

# Read the apportionment table, which has extra rows at the top
# and the bottom, using arguments to skip those rows, change the column
# names.
apportionment <- read_xlsx("apportionment-2020-table01.xlsx", skip = 4, n_max = 50,
                           col_names = c("State", "Apportionment_population", "Number_reps", "Change"))
View(apportionment)

# Read in the Civil Rights table, but change the country column from character to factor.
# Read the table from CSV.
civil_rights <- 
  read_csv("cirights.csv", col_types = "f")
View(civil_rights)

# Read in the Civil Rights table, but change the country column from character to factor,
# alternate syntax.
# Read the table from CSV.
civil_rights <- 
  read_csv("cirights.csv", col_types = cols(country = col_factor()))
View(civil_rights)


