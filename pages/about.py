from flask import Blueprint, render_template

info_bp = Blueprint("info", __name__)

@info_bp.route("/about")
def about_page():
    return render_template("about.html")

@info_bp.route("/privacy")
def privacy_page():
    return render_template("privacy.html")
