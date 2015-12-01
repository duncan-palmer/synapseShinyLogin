Author : Duncan P.
# UI file of getCookie Shiny application.
shinyUI(bootstrapPage(
  tags$head(tags$script(
                  HTML('
                        Shiny.addCustomMessageHandler("readCookie", function(message) {
                          var cookie = readCookie(message.name);
                          Shiny.onInputChange("cookie",cookie);
                        })
                        function readCookie(name) {
                          var nameEQ = name + "=";
                          var ca = document.cookie.split(";");
                          for(var i=0;i < ca.length;i++) {
                            var c = ca[i];
                            while (c.charAt(0)==" ") c = c.substring(1,c.length);
                            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
                            }   
                            return null;
                        }'))),
            mainPanel(
              actionButton('readCookie','Read Cookie'),
              textInput('cookieName','Name of Cookie')),
              uiOutput('profileName')
))
