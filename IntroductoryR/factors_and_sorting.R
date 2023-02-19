# The data for this script is from ourworldindata, and can be downloaded here:
# https://ourworldindata.org/coronavirus
# Source:
# Data published by	COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University
# Link	https://github.com/CSSEGISandData/COVID-19

# Read the table from CSV
library(readr)
covid <- read_csv("owid-covid-data.csv")
View(covid)

# Change continent to factor
covid_data <- read_csv("owid-covid-data.csv", 
                            col_types = cols(continent = col_factor(levels = 
                            c("Africa", "Asia", "Europe", "North America", 
                               "Oceania", "South America"))))
View(covid_data)

# Data for 2/16/23 only, continent, location, date, total_cases, and total_deaths
feb16 <- covid_data[covid_data$date == "2023-02-16" & !is.na(covid_data$continent), c(2,3,4,5,8)]
View(feb16)

# Show how a factor variable results in an appropriate plot
plot(feb16$continent, feb16$total_cases)

# Data for 2/16/23 only, including total_cases_per_million instead of total_cases
feb16alt <- covid_data[covid_data$date == "2023-02-16" & !is.na(covid_data$continent), c(2,3,4,11,8)]
View(feb16alt)

# A better plot
plot(feb16alt$continent, feb16alt$total_cases_per_million)

# Order feb16 data by total_cases_per_million
ordered_feb16 <- feb16alt[order(feb16alt$total_cases_per_million),]
View(ordered_feb16)


