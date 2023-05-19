import cherrypy


class HelloWorld(object):
    @cherrypy.expose
    def index(self):
        return "You have successfully reached " + cherrypy.request.headers["Host"]


cherrypy.quickstart(HelloWorld())
