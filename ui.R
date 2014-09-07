library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Computation of body mass index with dietary recommendations"),
    sidebarPanel(
      p("Adjust the sliders to match your height in centimeters and weight in kilogram! The currently selected values are also displayed and updated on the right."),
      sliderInput("height", "your height in cm", value = 175, min = 50, max = 250, step = 1),
      sliderInput("weight", "your weight in kg", value = 75, min = 10, max = 300, step = 1),
      br(),
      p("Once you have made your selection, click on the button to get a classification of your weight and some dietary advice."),
      actionButton("getAdvice", "Get dietary advice!"),
      br(),
      br(),
      br(),
      br(),
      p("The formula to compute the body mass index which is used in this application is as follows:"),
      withMathJax(),
      p("$$ \\mathrm{BMI} = \\frac{\\text{mass}(\\text{kg})}{\\left(\\text{height}(\\text{m})\\right)^2} $$"),
      p("If you are interested in learning even more about the body mass index visit the Wikipedia article at the following url:"),
      a("http://en.wikipedia.org/wiki/Body_mass_index", href="http://en.wikipedia.org/wiki/Body_mass_index")
    ),
    mainPanel(
        h4("Your input:"),
        textOutput("inputWeight"),
        textOutput("inputHeight"),
        h4("Calculated body mass index:"),
        textOutput("bmi"),
        conditionalPanel(condition = "input.getAdvice > 0", h4(textOutput("advice")))
    )
  )
)
