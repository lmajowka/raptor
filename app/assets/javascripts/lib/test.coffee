class Raptor.Lib.Test

  @version: ->
    forceVersion = @checkForceVersion()
    return forceVersion[1] if forceVersion
    return $.cookie("raptorversion") if $.cookie("raptorversion")
    @createCookie()

  @createCookie: ->
    version = Math.round((new Date).getTime()+Math.random()*1000000003366)
    $.cookie("raptorversion", version)
    version

  @checkForceVersion: ->
    location.href.match(/forceversion=([0-9]+)/)