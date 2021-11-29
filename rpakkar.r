#networkD3

library(rvest)
library(networkD3) 
library(htmlwidgets)

url <- "https://www.r-pkg.org/downloaded"

pk <- url %>% read_html() %>% html_nodes("h3") %>% html_text()
pk <- pk[1:100]
pk <- gsub("\n\t", "", pk)
pk <- gsub("\t\t", "", pk)
pk <- trimws(pk)
pk <- strsplit(pk, " ")
pk <- sapply(1:100, function(x) pk[[x]][1])

fra <- as.character(rep("R",100))

pakkedata <- data.frame(Source = fra, Target = pk, Value = 5)


pks <- simpleNetwork(pakkedata, Source = 1, Target = 2, height = NULL, width = NULL,
  linkDistance = 50, charge = -30, fontSize = 6, fontFamily = "serif",
  linkColour = "#666", nodeColour = "#3182bd", opacity = 0.8, zoom = T)

Sys.setenv(PATH = paste(c(Sys.getenv("PATH"), "C:\\Program Files\\RStudio\\bin\\pandoc;"), collapse = ""))
saveWidget(pks, file="C:\\Users\\n633164\\Documents\\R\\kurs_f�rde\\nettverk\\pakkar.html")
