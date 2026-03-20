# pages/admin.py

import sqlite3
from flask import Blueprint, flash, g, redirect, render_template, request, url_for
from config import DB
from utils.auth import get_user_by_uid, get_user_is_admin, login_required
from utils.debug import _debug

admin_bp = Blueprint("admin", __name__, url_prefix='/admin')


@admin_bp.route("/contacts")
@login_required
def admin_contacts():

    userdata = dict(g.current_user)
    is_admin = bool(userdata.get('own_is_admin', 'False'))
    if not is_admin:
        return redirect(url_for("home.home_page"))

    with sqlite3.connect(DB["name"]) as conn:
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()
        cursor.execute(
            "SELECT * FROM contacts WHERE cnt_status != 'Apagado' ORDER BY cnt_created_at DESC"
        )
        rows = cursor.fetchall()
        contacts = [dict(row) for row in rows]
        total = len(contacts)

    return render_template("admin/contacts_list.html", contacts=contacts, total=total)


@admin_bp.route("/contact/<int:contact_id>", methods=["GET", "POST"])
@login_required
def view_contact(contact_id):

    userdata = dict(g.current_user)
    is_admin = bool(userdata.get('own_is_admin', 'False'))
    if not is_admin:
        return redirect(url_for("home.home_page"))

    with sqlite3.connect(DB["name"]) as conn:
        conn.row_factory = sqlite3.Row
        cursor = conn.cursor()

        if request.method == "POST":

            form = {
                "name": request.form.get("name", "").strip(),
                "email": request.form.get("email", "").strip(),
                "subject": request.form.get("subject", "").strip(),
                "message": request.form.get("message", "").strip(),
                "status": request.form.get("status", "").strip(),
            }

            cursor.execute("""
                    UPDATE contacts SET 
                        cnt_name = ?,
                        cnt_email = ?,
                        cnt_subject = ?,
                        cnt_message = ?,
                        cnt_status = ?
                    WHERE cnt_id = ?
                """, (
                form["name"],
                form["email"],
                form["subject"],
                form["message"],
                form["status"],
                contact_id,
            ))
            conn.commit()

            if cursor.rowcount == 1:
                flash("Contato enviado com sucesso!", "success")
            else:
                flash("Oooops! Não foi possível enviar o contato.", "danger")

            return redirect(url_for("admin.admin_contacts"))

        else:

            cursor.execute(
                "SELECT * FROM contacts WHERE cnt_id = ? AND cnt_status != 'Apagado'",
                (contact_id,)
            )
            row = cursor.fetchone()

            if row is None:
                return redirect(url_for('admin.admin_contacts'))

            contact = dict(row)

            _debug(contact)

        return render_template('admin/contact_view.html', form=contact)
