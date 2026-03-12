# app.py

from flask import Flask
from config import APP

from pages.home import home_bp
from pages.about import about_bp

app = Flask(__name__)

@app.context_processor
def inject_globals():
    return {
        "app_title": APP["title"],
        "app_name": APP["name"],
    }

app.register_blueprint(home_bp)
app.register_blueprint(about_bp)

if __name__ == "__main__":
    app.run(debug=True)
