names(housing_affordability)
head(housing_affordability)
library(tidyverse)
london <- housing_affordability %>%
names(housing_affordability)
library(tidyverse)

names(housing_affordability)

head(housing_affordability)
library(tidyverse)
library(janitor)
housing_clean <- housing_affordability %>%
  row_to_names(row_number = 1) %>%
  clean_names()
names(housing_clean)
head(housing_clean)
install.packages("janitor")
library(janitor)
library(tidyverse)
library(janitor)

housing_clean <- housing_affordability %>%
  row_to_names(row_number = 1) %>%
  clean_names()

library(tidyverse)
library(janitor)

housing_clean <- housing_affordability %>%
  row_to_names(row_number = 1) %>%
  clean_names()

names(housing_clean)
library(tidyverse)

housing_clean <- housing_affordability

names(housing_clean) <- as.character(unlist(housing_clean[1, ]))

housing_clean <- housing_clean[-1, ]

names(housing_clean)

head(housing_clean)
london <- housing_clean %>%
  filter(`Country/Region name` == "London")

head(london)
london <- london %>%
  mutate(affordability_2025 = as.numeric(`2025`))
ggplot(london,
       aes(x = reorder(`Local authority name`, affordability_2025),
           y = affordability_2025)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "London Housing Affordability by Borough, 2025",
    subtitle = "Higher house price-to-earnings ratio = less affordable",
    x = "London borough",
    y = "House price-to-earnings ratio"
  )
ggsave("london_housing_affordability_2025.png", width = 10, height = 8)
ggplot(london,
       aes(x = reorder(`Local authority name`, affordability_2025),
           y = affordability_2025)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "London Housing Affordability by Borough, 2025",
    subtitle = "Higher house price-to-earnings ratio = less affordable",
    x = "",
    y = "House price-to-earnings ratio"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18, face = "bold"),
    axis.text.y = element_text(size = 9)
  )
ggsave("london_affordability_graph.png",
       width = 10,
       height = 8)
# -----------------------------
# Reshape data into long format
# -----------------------------

london_long <- london %>%
  pivot_longer(
    cols = `1997`:`2025`,
    names_to = "year",
    values_to = "affordability"
  )

# -----------------------------
# Convert variables to numeric
# -----------------------------

london_long <- london_long %>%
  mutate(
    year = as.numeric(year),
    affordability = as.numeric(affordability)
  )

# -----------------------------
# Select boroughs for comparison
# -----------------------------

selected_boroughs <- london_long %>%
  filter(`Local authority name` %in%
           c("Kensington and Chelsea",
             "Westminster",
             "Barking and Dagenham",
             "Croydon"))

# -----------------------------
# Create time-series graph
# -----------------------------

ggplot(selected_boroughs,
       aes(x = year,
           y = affordability,
           color = `Local authority name`)) +
  geom_line(size = 1.2) +
  labs(
    title = "Housing Affordability in Selected London Boroughs",
    subtitle = "House price-to-earnings ratio, 1997–2025",
    x = "Year",
    y = "Affordability Ratio",
    color = "Borough"
  ) +
  theme_minimal()

# -----------------------------
# Convert variables to numeric
# -----------------------------

london_long <- london_long %>%
  mutate(
    year = as.numeric(year),
    affordability = as.numeric(affordability)
  )
# -----------------------------
# Select boroughs for comparison
# -----------------------------

selected_boroughs <- london_long %>%
  filter(`Local authority name` %in%
           c("Kensington and Chelsea",
             "Westminster",
             "Barking and Dagenham",
             "Croydon"))
# Create time-series graph
# -----------------------------

ggplot(selected_boroughs,
       aes(x = year,
           y = affordability,
           color = `Local authority name`)) +
  geom_line(size = 1.2) +
  labs(
    title = "Housing Affordability in Selected London Boroughs",
    subtitle = "House price-to-earnings ratio, 1997–2025",
    x = "Year",
    y = "Affordability Ratio",
    color = "Borough"
  ) +
  theme_minimal()
ggsave("borough_affordability_trends.png",
       width = 10,
       height = 7)
# -----------------------------
# Calculate affordability growth since 1997
# -----------------------------

affordability_change <- london_long %>%
  filter(year %in% c(1997, 2025)) %>%
  select(`Local authority name`, year, affordability) %>%
  pivot_wider(
    names_from = year,
    values_from = affordability
  ) %>%
  mutate(
    percentage_change =
      ((`2025` - `1997`) / `1997`) * 100
  )

# View biggest increases
affordability_change %>%
  arrange(desc(percentage_change))
ggplot(affordability_change,
       aes(x = reorder(`Local authority name`,
                       percentage_change),
           y = percentage_change)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Increase in Housing Unaffordability Across London Boroughs",
    subtitle = "Percentage change in affordability ratio, 1997–2025",
    x = "",
    y = "% Change"
  ) +
  theme_minimal()
theme(
  axis.text.y = element_text(size = 8)
)ggsave("percentage_change_affordability.png",
        width = 10,
        height = 8)
# -----------------------------
# Create Crossrail variable
# -----------------------------

crossrail_boroughs <- c(
  "Westminster",
  "Ealing",
  "Newham",
  "Redbridge",
  "Havering",
  "Tower Hamlets"
)

affordability_change <- affordability_change %>%
  mutate(
    crossrail = ifelse(
      `Local authority name` %in% crossrail_boroughs,
      "Crossrail",
      "No Crossrail"
    )
  )
# -----------------------------
# Compare Crossrail vs non-Crossrail boroughs
# -----------------------------

ggplot(affordability_change,
       aes(x = crossrail,
           y = percentage_change,
           fill = crossrail)) +
  geom_boxplot() +
  labs(
    title = "Crossrail Access and Housing Affordability Deterioration",
    subtitle = "Percentage change in affordability ratio, 1997–2025",
    x = "",
    y = "% Change in Affordability Ratio"
  ) +
  theme_minimal()

