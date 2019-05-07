library(tidyverse)
library(dplyr)
library(RSQLite)
library(DBI)
library(ProjectTemplate)

# Connect to the sqlite file
sqlite.driver <- dbDriver("SQLite")

db <- dbConnect(sqlite.driver, dbname = "testdb.db")

dbListTables(db)

people <- dbReadTable(db,"people")
frequent_browsers <- dbReadTable(db,"frequent_browsers")
sites <- dbReadTable(db,"sites")
visits <- dbReadTable(db,"visits")
sqlite_sequence <- dbReadTable(db,"sqlite_sequence")

# merges people and visits by personId -- NOTE: the "visits" table has 10 visits from
# personId "0" for which there is no corresponding id in the "people" table (id: 1-30).
# There is no visits from personId 29 in the visits table
people_visits <- merge(people, visits, by.x =  "id", by.y="personId", all=FALSE)

# merges people_visits and sites by siteId -- NOTE: the "people_visits" table has 3 visits
# to siteID "0 for which there is no corresponding id in the "sites table (id: 1-100)
# 
people_sites <- merge(people_visits, sites, by.x ="siteId", by.y="id")

frequent_Browsers <- people_sites %>% 
  mutate(site_count = 1) %>% 
  group_by(id,first_name, last_name) %>% 
  summarize(total_visits = sum(site_count)) %>% 
  arrange(desc(total_visits)) %>% 
  head(10) %>% 
  ungroup() %>% 
  select(-first_name, -last_name)