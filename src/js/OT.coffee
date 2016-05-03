# TB Object:
#   Methods: 
#     TB.checkSystemRequirements() :number
<<<<<<< HEAD
#     TB.initPublisher( apiKey:String [, replaceElementId:String] [, properties:Object] ):Publisher
#     TB.initSession( apiKey, sessionId, speakerPhone ):Session 
=======
#     TB.initPublisher([targetElement:Element/String] [, properties:Object] [, completionHandler] ):Publisher
#     TB.initSession( apiKey, sessionId ):Session 
>>>>>>> IjzerenHein/master
#     TB.log( message )
#     TB.off( type:String, listener:Function )
#     TB.on( type:String, listener:Function )
#  Methods that doesn't do anything:
#     TB.setLogLevel(logLevel:String)
#     TB.upgradeSystemRequirements()

window.OT =
  checkSystemRequirements: ->
    return 1
<<<<<<< HEAD
  initPublisher: (one, two, three) ->
    return new TBPublisher( one, two, three )
  initSession: (apiKey, sessionId, speakerPhone ) ->
    if( not sessionId? ) then @showError( "OT.initSession takes 2 parameters, your API Key and Session ID and speakerPhone" )
    return new TBSession(apiKey, sessionId, speakerPhone)
=======
  initPublisher: (targetElement, properties, completionHandler) ->
    return new TBPublisher(targetElement, properties, completionHandler)
  initSession: (apiKey, sessionId ) ->
    if( not sessionId? ) then @showError( "OT.initSession takes 2 parameters, your API Key and Session ID" )
    return new TBSession(apiKey, sessionId)
>>>>>>> IjzerenHein/master
  log: (message) ->
    pdebug "TB LOG", message
  off: (event, handler) ->
    #todo
  on: (event, handler) ->
    if(event=="exception") # TB object only dispatches one type of event
      console.log("JS: TB Exception Handler added")
      Cordova.exec(handler, TBError, OTPlugin, "exceptionHandler", [] )
  setLogLevel: (a) ->
    console.log("Log Level Set")
  upgradeSystemRequirements: ->
    return {}
  updateViews: ->
    TBUpdateObjects()

  # helpers
  getHelper: ->
    if(typeof(jasmine)=="undefined" || !jasmine || !jasmine['getEnv'])
      window.jasmine = {
        getEnv: ->
          return
      }
    this.OTHelper = this.OTHelper || OTHelpers.noConflict()
    return this.OTHelper

  # deprecating
  showError: (a) ->
    alert(a)
  addEventListener: (event, handler) ->
    @on( event, handler )
  removeEventListener: (type, handler ) ->
    @off( type, handler )

window.TB = OT
window.addEventListener "orientationchange", (->
  setTimeout (->
    OT.updateViews()
    return
  ), 1000
  return
), false
