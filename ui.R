shinyUI(pageWithSidebar(
        headerPanel('Concrete mixture learning tool'),
        sidebarPanel(
                h3('Data Input'),
                sliderInput("Age", "Curing time [days]",
                            7, 70, 7, step=1),
                sliderInput("Cement", "Cement content [kg/m3]",
                            100, 500, 100, step=10),
                sliderInput("Water", "Water content [l/m3]",
                            100, 250, 100, step=10),
                sliderInput("FineAggregate", "Fine aggregate [kg/m3]",
                            700, 1100, 700, step=10),
                sliderInput("CoarseAggregate", "Coarse Aggregate [kg/m3]",
                            700, 1100, 700, step=10),    
                submitButton('Submit')
        ),
        mainPanel(
                h3('Instructions'),
                p('This application assists civil engineering students understand the antecedants of concrete strength class 
                  (the letter C followed by the predicted strength in MPa). The prediction 
                  is based on a four ingredient mixture and curing age.'),
                a("For more information, view this short presentation.", 
                  href="http://rpubs.com/pprevos/concrete"),
                p(" "),
                p('Please select the mixture by using the sliders on the left and click on the submit button to view the result below.'),
                
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
                p('This decision tree show how curing age of the concrete and mixture of ingredients influences compressive strength.'),
                p('Concrete younger than 10 days is not fully developed and its strength totally relies on the cement water paste'),
                p('For conrete older than 10 days, strength is also influenced by the aggregate fraction.'),
                p('This model is based on a series of assumptions and simplifications and can only be used for education purposes. 
                  For real applications the mixture is determined using analytical methods.'),
                h3('References'),
                p("Yeh, I. C. (1998). Modeling of strength of high-performance concrete 
                    using artificial neural networks.", 
                  span("Cement and Concrete Research", style="font-style: italic"), 
                  ", 28(12), 1797-1808. Elsevier."),
                a("Concrete Compressive Strength Data Set", href="http://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength"),
                h3(" ")
        )
))
