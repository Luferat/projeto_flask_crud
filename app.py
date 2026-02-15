# app.py

from flask import Flask
from pages.home import home_bp
from pages.about import about_bp, privacy_bp

app = Flask(__name__)

app.register_blueprint(home_bp)  # Página inicial
app.register_blueprint(about_bp)  # Página sobre
app.register_blueprint(privacy_bp)  # Página de políticas

if __name__ == '__main__':
    app.run(debug=True)
