import os
import cherrypy
import Actions


PATH = os.path.abspath(os.path.dirname(__file__))


class HTMLDocument(object):
    @cherrypy.expose
    def index(self):
        with open("example1.html", "r") as f:
            return f.read()


class Node(object):
    @cherrypy.expose
    def index(self):
        return "Eu sou o índice do Node (Node.index)"

    @cherrypy.expose
    def page(self):
        return "Eu sou um método do Node (Node.page)"


class Root(object):
    def __init__(self):
        self.node = Node()
        self.html = HTMLDocument()
        self.actions = Actions.Actions()

    @cherrypy.expose
    def index(self):
        return "Eu sou o índice do Root (Root.index)"

    @cherrypy.expose
    def page(self):
        return "Eu sou um método do Root (Root.page)"

    @cherrypy.expose
    def form(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("form1.html")


if __name__ == "__main__":
    conf = {
        "/": {
            "tools.staticdir.on": True,
            "tools.staticdir.dir": PATH,
        }
    }
    cherrypy.quickstart(Root(), "/", config=conf)
    