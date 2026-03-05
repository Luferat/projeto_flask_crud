-- (PERIGO) Apaga a tabela caso ela exista
DROP TABLE IF EXISTS users;

-- Cria a tabela ´users`
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
	
	-- Campo reservado para uso futuro
    metadata TEXT,
	status INTEGER NOT NULL DEFAULT 1,
	
	-- Se ´status = 1` usuário ATIVO
	-- Se ´status = 0` usuário APAGADO
	-- Somente ´0` e ´1` são permitidos em ´status`
    CHECK (status IN (0, 1))
);

-- Populando tabela ´users` com dados ´moch`

-- Cadastra um usuário
INSERT INTO users (name, email, password)
VALUES ('Joca da Silva', 'jocasilva@email.com.br', 'Senha@123');

-- Cadastra mais de um usuário
INSERT INTO users (name, email, password) VALUES
('Maria Cecília', 'macecil@email.com', 'Senha@123'),
('Hermenildo Souza', 'herme@email.com', 'Senha@123'),
('Setembrino Trocatapas', 'settapas@email.com', 'Senha123');

-- Lista os usuário cadastrados
SELECT * FROM users;

-- Lista somente nome e email
SELECT name, email FROM users;

-- Obtém o usuário com o ´id` específico
SELECT * FROM users WHERE id = '2';

-- Obtém usuários ATIVOS
SELECT id, name FROM users WHERE status = 1;

-- Altera o status do usuário com o ´id` especificado
UPDATE users SET status = '0' WHERE id = '2'; 

-- Lista todas as tabelas do banco de dados
SELECT * 
FROM sqlite_master 
WHERE type = 'table' 
  AND name NOT LIKE 'sqlite_%'   -- opcional: exclui tabelas internas do SQLite
ORDER BY name;

-- Apaga a tabela ´posts` caso exista
DROP TABLE IF EXISTS posts;

-- Cria a tabela ´posts`
CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    metadata TEXT,
    status INTEGER NOT NULL DEFAULT 1,
    CHECK (status IN (0, 1)),
	
	-- Chave estrangeira que aponta para o ´users.id`
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insere um ´posts`
INSERT INTO posts (title, content, user_id) VALUES
('Como cortar uma maçã', 'Coloque no prato e passe a faca.', '1');