Author : Duncan P.
# Server file of getCookie Shiny application. 
library(synapseClient)
shinyServer(function(input, output,session) { 
  observeEvent(input$readCookie, {
    session$sendCustomMessage(type="readCookie",message=list(name=input$cookieName))}) 

observeEvent(input$cookie, { 
    synapseLogin(sessionToken=input$cookie)
    uName <- synGetUserProfile()@displayName
    title <- paste('Hello',uName,'- you\'ve logged in!',sep=' ')
    output$nameGraph <- renderPlot({barplot(table(strsplit(uName,'')),xlab='Characters',ylab='Frequency',main=title)})}))
