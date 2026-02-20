# pages/_modelbp.py
# Blueprint modelo
# As setas apontam os dados que precisam ser modificados
# Dica: localize a expressão "home" e troque pelo nome da blueprint / página

from flask import Blueprint, render_template

# ↓                   ↓
home_bp = Blueprint("home", __name__)

#  ↓               ↓
@home_bp.route("/home")
def home_page(): # ←
    # Lógica da home entra aqui

    #                        ↓
    return render_template("home.html")
