class RequestHandler
	@hello: (request, response) ->
		response.writeHead(200, {"Content-Type": "text/plain"})
		response.write("nodejs webserver running")
		response.end()

class HTTPServer
	constructor: (port) ->
		@http = require('http')
		@port = port
		@server = @create_server()
	create_server: ->
		@http.createServer(RequestHandler.hello)
	start: ->
		@server.listen(@port)

http_server = new HTTPServer(8888)
http_server.start()