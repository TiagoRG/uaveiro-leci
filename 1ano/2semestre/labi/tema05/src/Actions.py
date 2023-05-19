import cherrypy


class Actions(object):
    @cherrypy.expose
    def do_login(self, username=None, password=None):
        if username is None or password is None:
            return "Preencha os campos!"
        else:
            return "Bem-vindo, %s!" % username
