#= require swagger-ui/dist/lib/shred.bundle
#= require swagger-ui/dist/lib/jquery-1.8.0.min
#= require swagger-ui/dist/lib/jquery.slideto.min
#= require swagger-ui/dist/lib/jquery.wiggle.min
#= require swagger-ui/dist/lib/jquery.ba-bbq.min
#= require swagger-ui/dist/lib/handlebars-1.0.0
#= require swagger-ui/dist/lib/underscore-min
#= require swagger-ui/dist/lib/backbone-min
#= require swagger-ui/dist/lib/highlight.7.3.pack
#= require swagger-ui/dist/lib/swagger
#= require swagger-ui/dist/swagger-ui

$ ->
  swaggerUi = new SwaggerUi
    url: "http://api.grape-swagger.local/doc.json"
    dom_id: "swagger-ui-container"
    supportedSubmitMethods: ['get', 'post', 'put', 'delete']
    onComplete: (swaggerApi, swaggerUi)->
      if console
        console.log "Loaded SwaggerUI"
        console.log swaggerApi
        console.log swaggerUi
      $('pre code').each (i, e)-> hljs.highlightBlock e
    onFailure: (data)->
      if console
        console.log "Unable to Load SwaggerUI"
        console.log data
    docExpansion: "list"
  # If you have a Basic Authentication on your API endpoint
  #window.authorizations.add(
    #"Basic",
    #new PasswordAuthorization("basic_auth", 'hello', 'world')
  #)
  swaggerUi.load()
