# app.py

from flask import Flask, render_template

# Importa as blueprints
from pages.home import home_bp
from pages.about import about_bp

app = Flask(__name__)

# Registra as blueprints
app.register_blueprint(home_bp)
app.register_blueprint(about_bp)

if __name__ == '__main__':
    app.run(debug=True)
