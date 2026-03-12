# app.py

from flask import Flask
from config import APP

from pages.home import home_bp
from pages.about import about_bp
from pages.contacts import contacts_bp
from pages.login import login_bp
from pages.newpad import newpad_bp
from pages.search import search_bp

app = Flask(__name__)


@app.context_processor
def inject_globals():
    return {
        "app_title": APP["title"],
        "app_name": APP["name"],
    }


app.register_blueprint(home_bp)
app.register_blueprint(about_bp)
app.register_blueprint(contacts_bp)
app.register_blueprint(login_bp)
app.register_blueprint(newpad_bp)
app.register_blueprint(search_bp)

if __name__ == "__main__":
    app.run(debug=True)
