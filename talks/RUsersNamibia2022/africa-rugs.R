library("leaflet")
library(dplyr)
library(forcats)
library(keyring)
library(mapview) # save leaflet
library(ggmap) #geocoding
library(readr)

# keyring::key_set("Google Geocoding API Key")

# csv exported from R Community Explorer
rladies <- read_csv("talks/RUsersNamibia2022/rladies.csv")
rugs <- read_csv("talks/RUsersNamibia2022/rugs.csv")

register_google(key_get("Google Geocoding API Key"))

locations_rladies <- rladies %>%
  filter(region == "Africa") %>%
  mutate(location = paste(city, country)) %>%
  mutate_geocode(location)

locations_rugs <- rugs %>%
  filter(region == "Africa" &
  !grepl("(R-Ladies|Data Science|Data Analytics|PyData|Master)", name)) %>%
  select(-lat, -lon) %>%
  mutate(location = paste(city, country)) %>%
  mutate_geocode(location)

locations_df <- bind_rows(rladies = locations_rladies, rugs = locations_rugs,
                          .id = "id", )

# override some that I know are active
locations_df[locations_df$city %in% c("Nairobi", "Kampala", "Dar es Salaam"),
             "last_event"] <- NA

locations_df <- locations_df %>%
  mutate(unbegun = past_events == 0,
         inactive = !(last_event > as.Date("2019-01-02") | is.na(last_event)))

plot_dat <- filter(locations_df, TRUE) %>%#!unbegun & !inactive) %>%
  group_by(lon, lat, city, country) %>%
  summarise(type = case_when(
    all(id == "rladies") ~ "rladies",
    all(id == "rugs") ~ "rugs",
    TRUE ~ "both"
  ))


write_csv(plot_dat, "rug_rladies_locations.csv")

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'white',
  library = 'ion',
  markerColor = case_when(
    plot_dat$type == "rladies" ~ "purple",
    plot_dat$type == "rugs" ~ "blue",
    TRUE ~ "cadetblue")
)

# Show first 20 rows from the `quakes` dataset
m <- leaflet(data = plot_dat, width = 600, height = 600) %>% addTiles() %>%
  addAwesomeMarkers(~lon, ~lat, popup = ~as.character(city),
                    label = ~as.character(city), icon = icons)
mapshot(m, file = "/media/veracrypt1/Work/Repos/website/talks/RUsersNamibia2022/africa-rugs.png")

#
locations_rladies <- rladies %>%
  mutate(location = paste(city, country)) %>%
  mutate_geocode(location)

locations_rugs <- rugs %>%
  filter(grepl(".*([Uu]se[rR]).*", name)) %>%
  select(-lat, -lon) %>%
  mutate(location = paste(city, country)) %>%
  mutate_geocode(location)

locations_df <- bind_rows(rladies = locations_rladies, rugs = locations_rugs,
                          .id = "id", ) %>%
  mutate(region = if_else(region == "Pacific/Galapagos", "Latin America", region),
         region = fct_infreq(region))

p <- ggplot(data = locations_df, aes(x = region)) +
  geom_bar(stat="count", fill="steelblue")+
  theme_minimal()
ggsave("rug_regions.png", p, width = 5, height = 2.5)
