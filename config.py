# config.py

# Configurações do site / aplicativo
APP = {
    # Nome do site para a tag `<title>...</title>`
    'title': 'MyPyPad',

    # Nome / logo do site, em HTML, para a tag `.navbar-brand` e outros usos
    'name': 'My<i class="bi bi-filetype-py text-warning px-0"></i>Pad',

    # Chave secreta (48 caracteres)
    # Obtenha essa chave rodando `python keygen.py`
    'secret_key': 'be36626fc9fb62b40bd8a4b86515aee9c6855d3b4c8c9352b3246289f961a4220a47d3cda5ff8c353118db190beb5873',
}

# Configurações do banco de dados
DB = {
    'name': 'database.db',
}

# Configurações dos cookies
COOKIE = {
    # Tempo de vida dos cookies em dias
    'livedays': 30,
}

# Configurações do e-mail
MAIL = {
    "send_contact": False,
    "server": "smtp.gmail.com",
    "port": 587,
    "username": "seuemail@gmail.com",
    "admin_email": "seuemail@gmail.com",
    # Acesse https://myaccount.google.com/apppasswords para gerar a senha de aplicativo abaixo
    "password": "senha de aplicativo aqui",
}
 