library(shiny)

ui <- fluidPage(
    titlePanel("Let's Do Arithmetic!"),
    sidebarLayout(
        sidebarPanel(
            numericInput(inputId = "number1",
                         label = "Number 1",
                         value = 0),
            numericInput(inputId = "number2",
                         label = "Number 2",
                         value = 0),
            actionButton(inputId = "click",
                         label = "Add"),
            actionButton(inputId = "click_prod",
                         label = "Multiply")
        ),
        mainPanel(
            h2("The sum of the two numbers is:"),
            textOutput("sum"),
            h2("The result of multiplying the two numbers is:"),
            textOutput("product")
        )
    )
)

server <- function(input, output) {
    x2 <- eventReactive(input$click, {
    as.numeric(input$number2)
    })
    x1 <- eventReactive(input$click, {
    as.numeric(input$number1)
    })
    output$sum <- renderText({
       x1() + x2()
    })
    x_2 <- eventReactive(input$click_prod, {
      as.numeric(input$number2)
    })
    x_1 <- eventReactive(input$click_prod, {
      as.numeric(input$number1)
    })
    output$product <- renderText({
      x_1() * x_2()
    })
}

shinyApp(ui = ui, server = server)


