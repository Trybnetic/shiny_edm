#!/usr/bin/Rscript
# -*- encoding: utf-8 -*-
# server.R
#
# (c) 2016 Marc Weitz <marc.weitz [at] trybnetic.org>
# GPL 3.0+ or (cc) by-sa (http://creativecommons.org/licenses/by-sa/3.0/)
#
# created 2016-11-25
# last mod 2016-12-07 MW
#

library(shiny)

server <- function(input, output) {


  output$model <- renderPlot({
    f <- function(t_i) {
      p_i <- input$phi * exp(-input$psi * (t_i - input$tau))
      return(p_i)
    }
    plot(f,
         ylim = c(0,1),
         ylab = "Retention Probability",
         xlim = c(0,15),
         xlab = "Time",
         main = "",
         from = input$tau)

    # adding vertical line for phi
    segments(x0=input$tau,
             y0=0,
             x1=input$tau,
             y1=f(input$tau),
             lty=2)

    # adding horizontal line for tau
    segments(x0=0,
             y0=input$phi,
             x1=input$tau,
             y1=f(input$tau),
             lty=2)

    # adding point of f(t)
    if(input$t > input$tau) {
      points(x=input$t,
             y=f(input$t))

      segments(x0=input$t,
               y0=0,
               x1=input$t,
               y1=f(input$t),
               lty=3)

      segments(x0=0,
               y0=f(input$t),
               x1=input$t,
               y1=f(input$t),
               lty=3)
    }
  })
}

shinyServer(server)
