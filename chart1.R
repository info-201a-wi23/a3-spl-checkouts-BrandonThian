library("ggplot2")
library("dplyr")

# Chart 1 will display a line graph of the number of Geronimo Stilton Book and E-book checkouts for each year from 2012-2022

my_spl_df <- read.csv("C:/Users/brand/Documents/University/Year 4/2. Winter/INFO 201/Coding Projects/spl_my_dataset.csv", stringsAsFactors = FALSE)

# Creating data frame for graph
chart1_df <- my_spl_df %>% 
  group_by(CheckoutYear, MaterialType) %>% 
  filter(MaterialType == "BOOK" | MaterialType == "EBOOK") %>%
  summarize(num_of_checkouts = sum(Checkouts, na.rm = TRUE))

# Plotting line graph
ggplot(data = chart1_df) +
  geom_point(aes(
    x = CheckoutYear, 
    y = num_of_checkouts,
    color = MaterialType)
  ) +
  geom_line(aes(
    x = CheckoutYear, 
    y = num_of_checkouts,
    color = MaterialType)
  ) + 
  labs(
    title = "Geronimo Stilton Book and E-Book Checkouts Over Time",
    x = "Year", 
    y = "Number of Checkouts",
    color = "Material Type"
  ) +
  scale_x_continuous(breaks =seq(2012, 2022, 1))


