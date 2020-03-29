library(tidyverse)
library(ggplot2)
library(ggrepel)
counties <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
states <- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv")

new_york_counties <- counties %>%
  filter(state == "New York")

new_york <- states %>%
  filter(state == "New York")

#Number of cases by state

ggplot() +
  geom_line(data = filter(states, state!= "New York"), aes(date, cases, group = state), color = "grey") +
  geom_line(data = filter(states, state== "New York"), aes(date, cases, group = state), color = "red")+
  labs(x = "",
       y = "Cases",
       title = "Number of Cases by State")  +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45))

#Number of cases by state (log)
ggplot() +
  geom_line(data = filter(states, state!= "New York"), aes(date, cases, group = state), color = "grey") +
  geom_line(data = filter(states, state== "New York"), aes(date, cases, group = state), color = "red")+
  scale_y_continuous(trans='log10') +
  labs(x = "",
       y = "Cases (log scale)",
       title = "Number of Cases by State",
       subtitle = "Cases in log Scale")  +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45))

#number of cases by county

ggplot() +
  geom_line(data = filter(new_york_counties, county != "Onondaga"), aes(date, cases, group = county), color = "grey") +
  geom_line(data = filter(new_york_counties, county == "Onondaga"), aes(date, cases, group = county), color = "red") +
  labs(x = "",
       y = "Cases",
       title = "Number of Cases by County in New York State")  +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45))

#number of case by county (log)

ggplot() +
  geom_line(data = filter(new_york_counties, county != "Onondaga"), aes(date, cases, group = county), color = "grey") +
  geom_line(data = filter(new_york_counties, county == "Onondaga"), aes(date, cases, group = county), color = "red") +
  scale_y_continuous(trans='log10') +
  labs(x = "",
       y = "Cases (log scale)",
       title = "Number of Cases by County in New York State",
       subtitle = "Cases in log Scale")  +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45))


#number of deaths by state
ggplot() +
  geom_line(data = filter(states, state!= "New York"), aes(date, deaths, group = state), color = "grey") +
  geom_line(data = filter(states, state== "New York"), aes(date, deaths, group = state), color = "red")+
  labs(x = "",
       y = "Deaths",
       title = "Number of Deaths by State")  +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45))

