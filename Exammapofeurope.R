library(leaflet)
library(tidyverse)
library(htmlwidgets)
library(tidygeocoder)
library(readr)
library(dplyr)


Easteuro <- leaflet() %>% 
  addTiles() %>% 
  setView(19.7876161, 50.032343, zoom = 4) %>% 
addProviderTiles("Esri.World.Physical", group = "Physical") %>% 
  addLayersControl(
    baseGroups = c("Aerial", "Physical","CartoDB.")
  )

Easteuro

Map_for_exam <- read_csv2("~/fuk/Map_for_exam.csv")
Map_for_exam <- read.csv2("~/fuk/Map_for_exam2.csv", 
                            dec = ".",
                            encoding = "UTF-8")


#lost feature: Flag Icon list

flagregister <-iconList(
  YUGO = makeIcon(
    iconUrl = "C:/Users/deadp/Documents/fuk/Smallflags/Yugoslavia.png",
    iconWidth = 1, iconHeight = 1,
    iconAnchorX = 5, iconAnchorY = 5) ,
  
  SOVIET = makeIcon(
    iconUrl = "C:/Users/deadp/Documents/fuk/Smallflags/Soviet_Union.png",
    iconWidth = 1, iconHeight = 1,
    iconAnchorX = 5, iconAnchorY = 5),
  
  BULGARIA = makeIcon(
    iconUrl = "C:/Users/deadp/Documents/fuk/Smallflags/Bulgaria.png",
    iconWidth = 1, iconHeight = 1,
    iconAnchorX = 5, iconAnchorY = 5),
  
  POLAND = makeIcon(
    iconUrl = "C:/Users/deadp/Documents/fuk/Smallflags/Poland.png",
    iconWidth = 1, iconHeight = 1,
    iconAnchorX = 5, iconAnchorY = 5),
  
  ROMANIA = makeIcon(
    iconUrl = "C:/Users/deadp/Documents/fuk/Smallflags/Romania.png",
    iconWidth = 1, iconHeight = 1,
    iconAnchorX = 5, iconAnchorY = 5),
  
  HUNGARY = makeIcon(
    iconUrl = "C:/Users/deadp/Documents/fuk/Smallflags/Hungary.png",
    iconWidth = 1, iconHeight = 1,
    iconAnchorX = 5, iconAnchorY = 5)
  
  
  )
Map_for_exam <- tibble(Map_for_exam) %>% 
  mutate (Flag_ID = as.factor(Flag_ID))
head(Map_for_exam)

#end of Flag Feature


Cities <- leaflet(Map_for_exam) %>% 
  addTiles() %>% 
  addMarkers(lng = Map_for_exam$Longitude,
             lat = Map_for_exam$Latitude,
             popup=paste(
        "<b>Current Name:</b>", Map_for_exam$X.U.FEFF.Current_name, "<br>",        
        "<b>Former Name:</b>", Map_for_exam$Former_name, "<br>",
        "<b>Year of current name change:</b>", Map_for_exam$Date_of_current_name_change, "<br>",
        "<b>Cause of Name Change:</b>", Map_for_exam$Reason_for_Name_change, "<br>")) %>% 
  setView(19.7876161, 50.032343, zoom = 4) %>% 
  addProviderTiles(providers$Stamen.Toner)


Cities <- leaflet(Map_for_exam) %>% 
  addTiles() %>% 
  addMarkers(group = Map_for_exam$Filter,
            lng = Map_for_exam$Longitude,
             lat = Map_for_exam$Latitude,
             popup=paste(
               "<b>Current Name:</b>", Map_for_exam$X.U.FEFF.Current_name, "<br>",        
               "<b>Former Name:</b>", Map_for_exam$Former_name, "<br>",
               "<b>Year of current name change:</b>", Map_for_exam$Date_of_current_name_change, "<br>",
               "<b>Cause of Name Change:</b>", Map_for_exam$Reason_for_Name_change, "<br>")) %>% 
  setView(19.7876161, 50.032343, zoom = 4) %>% 
  addProviderTiles(providers$CartoDB.Positron) %>% 
  addLayersControl(
    
    overlayGroups = c("Name Change: Post World War 1",
                      "Name Change: Communism",
                      "Name Change: Post World War 2",
                      "Name Change: De-Stalinization", 
                      "Name Change: Post Communist",
                      "Name Change: Referendum"),
    options = layersControlOptions(collapsed = FALSE)
  )


Cities
