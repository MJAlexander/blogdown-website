# Intro to R
# Monica Alexander

# load the tidyverse package
library(tidyverse)
# install.package("lubridate")
library(lubridate)


a <- 87
b <- 898

a+b
a*b # multiply
a/b # divide

2*a
8*b - a

# can't go
2b

# order of operations
(b+a)*2/b*(3*(b/(a+b)))



########################## 

### Variable types

# numeric


a_number <- 997
another_number <- 987

# using is.numeric function to test whether a_number is numeric
is.numeric(a_number)

# logical 
# either TRUE or FALSE

is_september <- TRUE
is_january <- FALSE

# testing:

is.logical(is_september)
is.logical(a_number)


# character (string)

department <- "Sociology"

is.character(department)

# this is case sensitive

department2 <- "sociology"


## are these two departments equal to each other?
# use ==

department == department2

# install using code
#install.packages("tidyverse")


# different types of variables --------------------------------------------

# single values

fruit <- "pear"
d <- 7

# vectors 
# defined with the function c()

vector_of_numbers <- c(98,4,1,5098)

c(6, 8,4,5)

vector_of_departments <- c("sociology", "statistics")

# check: length of a vector
length(vector_of_numbers)

# tibbles (data frames)

my_data <- tibble(
  student = c(10909, 298798,87876), 
  grade = c("A", "A+", "A")
)

# check dimensions

dim(my_data) # nrows x n cols


# functions ---------------------------------------------------------------

# mean of numbers
mean(vector_of_numbers)
median(vector_of_numbers)
min(vector_of_numbers)

# notice you can't get the mean of characters
mean(vector_of_departments)

# paste: useful for characters

my_first_name <- "Monica"
my_last_name <- "Alexander"

paste(my_first_name, my_last_name)



# read in some data -------------------------------------------------------

d <- read_csv("deaths_fatality_type.csv")

# select
death_dates <- select(d,date)

## same thing:

d |>
  select(date) 

# arrange

# ascending
d |> 
  arrange(deaths_total)

# descending

d |> 
  arrange(-deaths_total)

# arrange by more than one

d |> 
  arrange(-deaths_total, -death_covid)

# mutate

# making a new column

d2 <- d |> 
  mutate(is_deaths_covid_neg = death_covid < 0) # checking to see whether covid detahs column is negative

# filter

# filtering out rows based on values in a specific column 

df <- d |> 
  filter(deaths_total>=0) # just keep positive death counts

# summarize (summarise)

# getting summaries of variables

# calculate the mean number of total deaths (not negative)

df |> 
  summarise(mean_deaths_per_day = mean(deaths_total))

# earliest date
# latest date

df |> 
  summarise(first_day = min(date),
            last_day = max(date))

# group_by

# use group_by and summarize to calculate the total deaths by year

# first step: create a new column called year

df <- df |> 
  mutate(year = year(date))

df |> 
  group_by(year) |> 
  summarize(total_yearly_deaths = sum(deaths_total))

df |> 
  group_by(year) |> 
  summarize(average_daily_deaths = mean(deaths_total))


monthly_totals <- df |> 
  mutate(month = month(date)) |> 
  group_by(year, month) |> 
  summarize(total_monthly_deaths = sum(deaths_total))



# ggplot ------------------------------------------------------------------


# filtering out deaths that are abnormally large
df <- df |> 
  filter(deaths_total<500)

ggplot(data = df, aes(x = date, y = deaths_total)) + 
  geom_point(col = "skyblue2") +
  labs(title = "Daily deaths due to Covid",
       subtitle = "Ontario, April 2022 -- Sep 2022",
       x = "Date",
       y = "Daily deaths"
       )








  



