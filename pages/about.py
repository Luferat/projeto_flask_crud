# pages/about.py

from flask import Blueprint, render_template

about_bp = Blueprint("about", __name__)
privacy_bp = Blueprint("privacy", __name__)

@about_bp.route("/about")
def about_page():
    return render_template("about.html")

@privacy_bp.route("/privacy")
def privacy_page():
    return render_template("privacy.html")