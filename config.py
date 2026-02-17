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
COOKIE = {}
