#
# Recreate a chart from ourworldindata.com
# using this data:
# Source: Michael Clark et al (2022). Estimating the environmental impacts of 57,000 food products. PNAS.
# Retrieved from https://ourworldindata.org/explorers/food-footprints?facet=none&uniformYAxis=0&Commodity+or+Specific+Food+Product=Specific+food+products&Environmental+Impact=Carbon+footprint&Kilogram+%2F+Protein+%2F+Calories=Per+kilogram&By+stage+of+supply+chain=false&country=Beef+%28beef+herd%29~Lamb+%26+Mutton~Beef+%28dairy+herd%29~Prawns+%28farmed%29~Cheese~Pig+Meat~Poultry+Meat~Eggs~Rice~Tofu+%28soybeans%29~Milk~Tomatoes~Maize~Wheat+%26+Rye~Peas~Bananas~Potatoes~Nuts~Almonds~Avocados~Beef+burger~Cow%27s+milk~Dairy-free+ice+cream~Lentils~Vegan+pizza~Almond+milk~Bread~Meat+pizza~Vegetable+lasagne~Macaroni+cheese~Coconut+milk~Beans
#

# Load the readr library.
if(!require(readr)) install.packages("readr")
library(readr)

# Read in the food footprints data.
food <- read_csv("food-footprints.csv")
View(food)

# Select the Entity and Emissions per kilogram columns and selected foods.
entities <- c("Beef burger", "Macaroni cheese", "Meat pizza", "Eggs", "Rice", "Cow's milk",
              "Vegetable lasagne", "Coconut milk", "Lentils", "Dairy-free ice cream",
              "Tomatoes", "Vegan pizza", "Avocados", "Bread", "Bananas", "Almond milk",
              "Almonds", "Potatoes")
foods_vis <- food[food$Entity %in% entities, c(21, 1)]
View(foods_vis)

# Sort by emissions and make the Entity column a factor with sorted levels.
foods_vis_sorted <- foods_vis[order(foods_vis$'Emissions per kilogram'),]
View(foods_vis_sorted)
foods_vis_sorted$Entity <- factor(foods_vis_sorted$Entity, levels = foods_vis_sorted$Entity)

# Add a column for the bar labels, rounded emissions data with "kg" appended.
foods_vis_sorted$bar_labels <- paste(round(foods_vis_sorted$'Emissions per kilogram', 2), "kg")

# Load the ggplot2 library.
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Plot the data.
ggplot(foods_vis_sorted, aes(x=Entity, y=`Emissions per kilogram`, label = bar_labels, fill = `Emissions per kilogram` )) +
  geom_bar(stat="identity") + coord_flip() + geom_text(nudge_y = 4)





