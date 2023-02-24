library("ggplot2")
library("dplyr")
library("stringr")

# Chart 2 will display a line graph of the number of different publishers of Geronimo Stilton books that were checked out between 2012 to 2022

my_spl_df <- read.csv("C:/Users/brand/Documents/University/Year 4/2. Winter/INFO 201/Coding Projects/spl_my_dataset.csv", stringsAsFactors = FALSE)

# Cleaning Publisher column
chart2_df <- my_spl_df
chart2_df$Publisher[str_detect(chart2_df$Publisher, "Scholastic")] <- "Scholastic, Inc."
chart2_df$Publisher[str_detect(chart2_df$Publisher, "Papercutz")] <- "Papercutz"
chart2_df$Publisher[str_detect(chart2_df$Publisher, "Destino")] <- "Destino"

# Creating data frame for graph
chart2_df <- chart2_df %>% 
  group_by(CheckoutYear, Publisher) %>% 
  summarize(num_of_checkouts = sum(Checkouts, na.rm = TRUE))

# Plotting line graph
ggplot(data = chart2_df) +
  geom_line(aes(
    x = CheckoutYear, 
    y = num_of_checkouts,
    color = Publisher,
    )
  ) +
  labs(
    title = "Number of Checkouts Over Time By Publisher",
    x = "Year", 
    y = "Number of Checkouts",
  ) + 
  scale_x_continuous(breaks =seq(2012, 2022, 1))

