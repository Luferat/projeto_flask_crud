from flask import Blueprint, render_template

info_bp = Blueprint("info", __name__)

@info_bp.route("/about")
def about_page():
    page_title = "Sobre..."
    return render_template("about.html", page_title=page_title)

@info_bp.route("/privacy")
def privacy_page():
    page_title = "Políticas de Privacidade"
    return render_template("privacy.html", page_title=page_title)
