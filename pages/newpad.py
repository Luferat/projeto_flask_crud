# pages/newpad.py

from flask import Blueprint, render_template

newpad_bp = Blueprint("newpad", __name__)

@newpad_bp.route("/newpad")
def newpad_page():
    return render_template("newpad.html")