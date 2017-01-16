#!/usr/bin/Rscript
# -*- encoding: utf-8 -*-
# ui.R
#
# (c) 2016 Marc Weitz <marc.weitz [at] trybnetic.org>
# GPL 3.0+ or (cc) by-sa (http://creativecommons.org/licenses/by-sa/3.0/)
#
# created 2017-01-15
# last mod 2017-01-16 MW
#


library(shiny)

ui <- fluidPage(

  tags$head( tags$script(src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full", type = 'text/javascript'),
               tags$script( "MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});", type='text/x-mathjax-config')
    ),
  titlePanel("Expontential Decay Model of Memory Retention"),

  fluidRow(
    column(3,
      wellPanel(
      #  h5("Modellgleichung"),
      #  HTML($$p_i = \\phi exp(-\\psi(t_i-\\tau_i))$$),
      #  h5("Modellparameter"),
        sliderInput("phi",
                    label = HTML("$\\phi$"),
                    value = .8,
                    min = 0.0,
                    max = 1.0,
                    step = .01),
        sliderInput("psi",
                    label = HTML("$\\psi$"),
                    value = 0.8,
                    min = 0.0,
                    max= 5.0,
                    step = .1),
        sliderInput("tau",
                    label = HTML("$\\tau$"),
                    value = 2,
                    min = 0.0,
                    max = 15.0,
                    step = .1),
        sliderInput("t",
                    label = HTML("$t$"),
                    value = 4,
                    min = 0.0,
                    max = 15,
                    step = .1)
      ),

      wellPanel(
        h4("About"),
          HTML('&copy;<em> 2017 by Marc Weitz. The source code of this app is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">CC BY SA 4.0 License</a> and is published on <a href="https://github.com/Trybnetic/shiny_edm">Github</a>.</em>')
      )
    ),

    column(9,
      plotOutput("model"),
      wellPanel(
        h4("Equation"),
          HTML('$$p_i = \\phi e^{-\\psi(t_i-\\tau_i)}$$')
      )
    )
  )
)

shinyUI(ui)
