library(shiny)

ui <- fluidPage(
  titlePanel("Planificador de Eventos "),
  
  sidebarLayout(
    sidebarPanel( 
      width = 4,
      br(),
      textInput(inputId = "Nombre_del_evento", 
                label = "Nombre del evento:"),
      br(),
      selectInput(inputId = "Tema_del_evento", 
                  label = "Tema del evento:", 
                  choices = c("Boda", "Fiesta de cumpleaños", "Conferencia", "Otro"),
                  multiple = FALSE),
      
      numericInput(inputId = "Número_de_invitados", 
                   label = "Número de invitados:", 
                   value = 25, 
                   min = 25, 
                   max = 120
      ),
      selectInput(inputId = "Provincia", 
                  label = "Provincia:", 
                  choices = c("San José", "Cartago", "Heredia", "Aljuela", "Limon", "Puntarenas", "Guanacaste"),
                  multiple = FALSE),
      ),
      mainPanel(
        width = 7,
        br(),
        br(),
        h2(span("Vamos a planificar su día especial!", style = "color:blue"), align = "center"),
        tags$hr(style="border-color: blue;"),
        h3("Detalles del evento:"),
        br(),
        textOutput("Nombre del evento"),
        br(),
        textOutput("Tema del evento"),
        textOutput("Número de invitados y ubicación"),
      )
    )
  )

server <- function(input, output, session) {
} 
shinyApp(ui, server)