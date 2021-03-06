% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bulma-input.R
\name{text-input}
\alias{text-input}
\alias{bulmaTextInput}
\alias{bulmaTextAreaInput}
\alias{bulmaUpdateTextInput}
\title{Add text input}
\usage{
bulmaTextInput(inputId, label = NULL, placeholder = "", color = NULL)

bulmaTextAreaInput(inputId, label = NULL, placeholder = "", rows = 1,
  color = NULL, size = NULL, disabled = FALSE, readonly = FALSE)

bulmaUpdateTextInput(session, inputId, value = NULL)
}
\arguments{
\item{inputId}{The input slot that will be used to access the value.}

\item{label}{Input label.}

\item{placeholder}{Input placeholder.}

\item{color}{A valid bulma color, e.g.:\code{success}.}

\item{rows}{Number of rows of text.}

\item{size}{A valid bulma \emph{text} size, \code{small}, \code{medium} or \code{large}.}

\item{disabled, readonly}{Set to \code{TRUE} to disable or set on read-only.}

\item{session}{A shiny session.}

\item{value}{Value to update.}
}
\description{
Add text input.
}
\examples{
if(interactive()){
library(shiny)

shinyApp(
  ui = bulmaNavbarPage(
   theme = "dark",
   bulmaTextInput("txt", label = "Input text", placeholder = "Type here"),
   verbatimTextOutput("txtOutput"),
   bulmaTextAreaInput("txtArea", rows = 10, label = "Input text area", 
                      color = "primary", size = "medium"),
   verbatimTextOutput("txtAreaOutput"),
   bulmaTextAreaInput("disabled", label = "disabled", disabled = TRUE, 
                      placeholder = "disabled"),
   bulmaActionButton("update", "Update text input")
  ),
  server = function(input, output, session) {
    output$txtOutput <- renderPrint({ input$txt })
    output$txtAreaOutput <- renderPrint({ input$txtArea })
    observeEvent( input$update, {
      updateTextInput(session, "txt", value = "Updated")
    })
  }
)
}
}
\author{
John Coene, \email{jcoenep@gmail.com}
}
