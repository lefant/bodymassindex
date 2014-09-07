calc_bmi <- function(mass, height) mass / (height ^ 2)

classify <- function(bmi) {
  if (bmi < 18.5) "underweight"
  else if (bmi > 25) "overweight"
  else "normal"
}

gen_advice <- function(class) {
  switch(class,
         "underweight" = "eat more",
         "overweight" = "eat less",
         "normal" = "continue eating as you currently do")
}

shinyServer(
  function(input, output) {
    output$inputWeight <- renderText({paste("weight:", input$weight)})
    output$inputHeight <- renderText({paste("height:", input$height)})
    bmi <- reactive({calc_bmi(input$weight, input$height / 100)})
    class <- reactive({classify(bmi())})
    advice <- reactive({gen_advice(class())})
    output$bmi <- renderText({bmi()})
    output$advice <- renderText({
      paste("You are classified as ", class(), ", you should ", advice(), "!", sep="")
    })
  }
)
