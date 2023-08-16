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
      br(),
      numericInput(inputId = "Número_de_invitados", 
                   label = "Número de invitados:", 
                   value = 25, 
                   min = 25, 
                   max = 120
      ),
      br(),
      selectInput(inputId = "Provincia", 
                  label = "Provincia:", 
                  choices = c("San José", "Cartago", "Heredia", "Aljuela", "Limon", "Puntarenas", "Guanacaste"),
                  multiple = FALSE),
      
    ),
    mainPanel(
      h2(strong("Vamos a planificar su día especial!", style = "color:blue"), align = "center"),
      tags$hr(style="border-color: blue;"),
      h3(strong("Detalles del evento:"), width = 7),
      hr(),
      textOutput("Nombre del evento"),
      hr(),
      textOutput("Tema del evento"),
      textOutput("Número de invitados y ubicación"),
    )
  )
)

server <- function(input, output) { 
  
  output$Nombre_del_evento<- renderText({paste0("Nombre del evento:", 
                                                input$Nombre_del_evento, ".")
    
  })
  
  output$Tema_del_evento<- renderText({paste0("Tema del evento:", 
                                              input$Tema_del_evento, ".")
    
  })    
  
  output$Número_de_invitados<- renderText({paste0("Número de invitados y ubicación:", 
                                                  input$Número_de_invitados,".", Provincia,".")
    
  })  
}
shinyApp(ui, server)