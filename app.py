# app.py

from flask import Flask
from pages.home import home_bp
from pages.about import info_bp
from pages.contacts import contacts_bp
from pages.login import login_bp
from pages.newpad import newpad_bp
from pages.search import search_bp

app = Flask(__name__)

app.config['APP_TITLE'] = 'MyPyPad'
app.config['APP_NAME'] = 'My<i class="bi bi-filetype-py text-warning px-0"></i>Pad'


@app.context_processor
def inject_globals():
    return {
        "app_title": app.config["APP_TITLE"],
        "app_name": app.config["APP_NAME"],
    }


app.register_blueprint(home_bp)  # Home
app.register_blueprint(info_bp)  # Sobre, Políticas de Privacidade
app.register_blueprint(contacts_bp)  # Contatos
app.register_blueprint(login_bp)  # Login
app.register_blueprint(newpad_bp)  # Novo Pad
app.register_blueprint(search_bp)  # Pesquisa

if __name__ == '__main__':
    app.run(debug=True)
