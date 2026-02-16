# app.py

from flask import Flask
from pages.home import home_bp

app = Flask(__name__)

app.register_blueprint(home_bp)  # Home

if __name__ == '__main__':
    app.run(debug=True)
