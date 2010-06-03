from bottle import route, run, request, response, send_file, abort, template
import datetime
from pygments import highlight
from pygments.lexers import PythonLexer
from pygments.formatters import HtmlFormatter
from pymongo import Connection, collection


from pymongo import Connection, collection
conn = Connection()
db = conn.pasteme
co = db.pastedstuff



@route('/')
def index():
    return template('static/index.tpl')

@route('/p/:id')
def pasted_item(id):
    doc = co.find_one({'_id':collection.ObjectId(id)})
    code = doc['body']
    cc = highlight(code, PythonLexer(), HtmlFormatter(style = "colorful"))
    return template('static/pasted.tpl', code=cc, _id=id, date=doc['date'])

@route('/paste', method='POST')
def paste():
    code = request.POST['code']
    id=None
    if request.POST.__contains__('_id'):
        id = request.POST['_id']
    paste = { 'body': code, 'date':datetime.datetime.utcnow() }
    if id == None:
        ret = co.insert(paste)
    else:
        co.update({'_id':collection.ObjectId(id)}, paste)
        ret=id

    cc = highlight(code, PythonLexer(), HtmlFormatter(style = "colorful"))
    return template('static/ok.tpl', url='/p/%s' % ret, body=cc)

@route('/static/:filename#.*#')
def static_file(filename):
    send_file(filename, root='static/')


run(host='localhost', port=8080)
