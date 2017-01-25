library(shiny)

d <- read.csv("toweb_2015.csv")
names <- as.character(unique(unlist(d$CITY)))

shinyUI(fluidPage(
  titlePanel(strong("Predicted Crime Rates")),
  sidebarLayout(
    sidebarPanel(
      h5(strong("Choose Crime Type:")),   # header type #5 is used here along with boldface (strong)
      selectInput("variable", label=NULL,
                  choices=list("", "Violent Crime", "Property Crime"), selected=""),
      h5(strong("Choose Time Period:")),
      selectInput("year", label=NULL,
                  choices=list("", "2017", "Change, 2015-2017"), selected=""),
      h5(strong("Choose City:")),
      selectInput("city", label=NULL, choices = names[order(names)], selected="Irvine"),
      actionButton("go", label="Go/Refresh"),  # an input item that can be used with observeEvent
      br(),   # add a line break
      p(strong("Data Notes:")),
      textOutput("var_desc"),
      br(),
      textOutput("yr_desc"),
      br(),
      a("Irvine Laboratory for the Study of Space and Crime", href="http://ilssc.soceco.uci.edu"),
      img(src="ilssc.png", height=200, width=200)
    ),
    mainPanel(
      h2("Cities in Southern California - Histogram"),
      p(em("Predicted crime values of all cities in Southern California are displayed below.")),   #em is used for italics
      plotOutput("hist", height = 400), 
      p("Value for selected city:"),
      verbatimTextOutput("data1"),
      p("Values for all cities:"),
      verbatimTextOutput("data2")
    )
  )
))