shinyUI(pageWithSidebar(
        headerPanel('Concrete mixture learning tool'),
        sidebarPanel(
                h3('Data Input'),
                sliderInput("Age", "Curing time [days]",
                            7, 70, 28, step=1),
                sliderInput("Cement", "Cement content [kg/m3]",
                            100, 500, 300, step=10),
                sliderInput("Water", "Water content [l/m3]",
                            100, 250, 200, step=10),
                sliderInput("FineAggregate", "Fine aggregate [kg/m3]",
                            700, 1100, 750, step=10),
                sliderInput("CoarseAggregate", "Coarse Aggregate [kg/m3]",
                            700, 1100, 900, step=10)           
        ),
        mainPanel(
                h3('Instructions'),
                p('This application predicts the most likely concrete strength class 
                  (the letter C followed by the predicted strength in MPa). The prediction 
                  is based on a five ingredient mixture.'),
                a("For more information, view this short presentation.", 
                  href="http://rpubs.com/pprevos/concrete"),
                p(" "),
                p('Please select the mixture by using the sliders on the left.'),
                
                h3('Entered data'),
                textOutput("cement"),
                textOutput("water"),
                textOutput("course"),
                textOutput("fine"),
                textOutput("age"),
                
                h3('Prediction'),
                div(textOutput("predict"), style="background-color: lightgray"),
                
                h3('Background Information'),
                p('The prediction is made based on the following prediction tree:'),
                plotOutput('plot'),
                p('This tree was created by employing a regression tree on the concrete 
                  compressive strenth dataset (Yeh, 1998)'),
                
                h3('References'),
                p("Yeh, I. C. (1998). Modeling of strength of high-performance concrete 
                    using artificial neural networks.", 
                  span("Cement and Concrete Research", style="font-style: italic"), 
                  ", 28(12), 1797-1808. Elsevier."),
                a("Concrete Compressive Strength Data Set", href="http://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength"),
                h3(" ")
        )
))
