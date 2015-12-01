Author : Duncan P.
# Server file of getCookie Shiny application. 
library(synapseClient)

shinyServer(function(input, output,session) { 
  observeEvent(input$readCookie, {
    session$sendCustomMessage(type="readCookie",message=list(name=input$cookieName))}) 
  observeEvent(input$cookie, {
    synapseAuthServiceEndpoint('https://auth-staging.prod.sagebase.org/auth/v1')
    synapseRepoServiceEndpoint('https://repo-staging.prod.sagebase.org/repo/v1')
    synapseFileServiceEndpoint('https://file-staging.prod.sagebase.org/file/v1')
    synapseLogin(sessionToken=input$cookie)
    output$profileName <- renderText({synGetUserProfile()@displayName})
    })
    
})
