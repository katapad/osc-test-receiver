#UDP = require "./UDPServer"

osc = require "node-osc"
log4js = require 'log4js'
logger = log4js.getLogger 'App'

###
default port: 5555
###
argv = require('minimist')(process.argv.slice(2), {
  default: {p: 5555}
})

class App
  constructor: (port) ->
#    udp = new UDP(5555)

    oscServer = new osc.Server(port, '0.0.0.0')
    oscServer.on "message", (msg, rinfo)->
      logger.debug("Get message", msg);
    logger.debug("OSC Server Created", port);

new App(argv.p)