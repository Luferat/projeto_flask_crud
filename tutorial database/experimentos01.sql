-- Modelo Físico do banco de dados para SQLite

-- Apaga a tabela 'posts' caso ela já exista
-- Apague na ordem inversa da criação por causa do relacionamento
-- PERIGO! Não use isso em produção
DROP TABLE IF EXISTS posts;

-- Apaga a tabela 'users' caso ela já exista
-- PERIGO! Não use isso em produção
DROP TABLE IF EXISTS users;

-- Cria a tabela 'users'
CREATE TABLE users (
	-- Define a chave primária
	u_id INTEGER PRIMARY KEY AUTOINCREMENT,
	
	-- Obtém a data atual como padrão
	u_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
	
	-- O campo precisa ser preenchido
	u_name TEXT NOT NULL,
	
	-- O e-mail é único
	u_email TEXT NOT NULL UNIQUE,
	
	-- A criptografia da senha fica à cargo do aplicativo
	u_password TEXT NOT NULL
);


-- Cria a tabela 'posts' apos 'users' por causa do relacionamento
CREATE TABLE posts (
	-- Define a chave primária
	p_id INTEGER PRIMARY KEY AUTOINCREMENT,
	
	-- Obtém a data atual como padrão
	p_created_at TEXT DEFAULT CURRENT_TIMESTAMP,
	
	-- Título do artigo
	p_title TEXT NOT NULL,
	
	-- Conteúdo do artigo
	p_content TEXT,
	
	-- ID do proprietário do artigo
	p_owner INTEGER,
	
	-- `p_owner` é chave estrangeira para users(u_id)
	FOREIGN KEY (p_owner) REFERENCES users (u_id)	
);


-- Mostra as estruturas atuais do banco de dados
SELECT * FROM sqlite_master;

-- Mostra o nome de todas as tabelas atuais
SELECT name FROM sqlite_master WHERE type = 'table';

-- CREATE → INSERT INTO
-- Adiciona registros (linhas / rows) na tabela "users"
INSERT INTO users 
	(u_name, u_email, u_password) 
VALUES
	('Joca da Silva', 'jocasilva@email.com', 'Senha@123');
	
-- READ → SELECT
-- Listar todos os campos do usuário cadastrado acima
SELECT * FROM users;

-- CREATE → INSERT INTO
-- Popula a tabela 'users' com várias linhas
INSERT INTO users
	(u_name, u_email, u_password)
VALUES
	('Marineuza Siriliano', 'marineuza@email.com', 'Senha@123'),
	('Setembrino Trocatapas', 'settapas@email.com', 'Senha@123'),
	('Fromenzilda Suarez', 'fronxzen@email.com', 'Senha@123'),
	('Ederbaldio Sarrasceno', 'ederceno@email.com', 'Senha@123');
	
-- Lista os registros de 'users'
-- Em ordem alfabética
SELECT u_id, u_name FROM users ORDER BY u_name ASC;	

-- UPDATE → UPDATE
-- Atualiza um registro
UPDATE users 
	SET u_email = 'marineuzinha@email.com'
	WHERE u_id = '2';

	
-- Lista os registros de 'users'
-- Em ordem alfabética
SELECT u_id, u_name, u_email FROM users ORDER BY u_name ASC;

-- Forma errada de usar UPDATE
-- UPDATE users SET u_name = 'Testezinho';	
-- SELECT * FROM users;


-- DELETE → DELETE
-- Apaga o registro com o u_id informado
DELETE FROM users WHERE u_id = '4';
SELECT * FROM users;

-- Forma errada de usar DELETE
-- DELETE FROM users;
-- SELECT * FROM users;

-- INSERT INTO users
-- 	(u_name, u_email, u_password)
-- VALUES
-- 	('Marineuza Siriliano', 'marineuza@email.com', 'Senha@123'),
-- 	('Setembrino Trocatapas', 'settapas@email.com', 'Senha@123'),
-- 	('Fromenzilda Suarez', 'fronxzen@email.com', 'Senha@123'),
-- 	('Ederbaldio Sarrasceno', 'ederceno@email.com', 'Senha@123');
-- SELECT * FROM users;


INSERT INTO users 
	(u_id, u_name, u_email, u_password)
VALUES
	('4', 'Outra Pessoa', 'outrapessoa@email.com', 'Senha@123');
SELECT * FROM users;

-- Cadastra alguns 'posts'
INSERT INTO posts 
	(p_title, p_content, p_owner)
VALUES
	('Como fazer pipoca', 'Frite o milho até estourar.', '2'),
	('Melhorando as aparências', 'Cave um buraco e se enterre nele.', '4'),
	('Criando frangos', 'Monte um galinheiro e coloque galinhas lá.', '1'),
	('Criando cães de guerra', 'Assista aos filmes do Rambo.', '1');

SELECT * FROM posts;	

-- Observe que "p_owner" deve receber um "users.u_id" válido
-- O SQL abaixo gera erro "FOREIGN KEY constraint failed"
-- INSERT INTO posts
-- 	(p_title, p_content, p_owner)
-- VALUES
-- 	('Como fazer tapioca', 'Frite o milho até endurecer.', '9');

SELECT * FROM posts;


-- Consulta com relacionamento
SELECT * FROM posts
INNER JOIN users ON p_owner = u_id;

-- Consulta com relacionamento mais detalhada
SELECT
	p_id, P_title, u_id, u_name
FROM posts
	INNER JOIN users ON p_owner = u_id;


-- Consulta com relacionamento mais detalhada
SELECT
	p_id, p_title, u_id, u_name
FROM posts
	LEFT JOIN users ON p_owner = u_id;

-- Pesquisa nos "posts" usando LIKE e o curinga '%'
SELECT * FROM posts 
INNER JOIN users ON p_owner = u_id
WHERE p_title LIKE '%pipoca%' OR p_content LIKE '%pipoca%';

-- Pesquisa nos "posts" usando LIKE e o curinga '%'
SELECT * FROM posts 
INNER JOIN users ON p_owner = u_id
WHERE p_title LIKE '%cães%' OR p_content LIKE '%cães%';

-- Ver a codificação de caracteres atual
-- O ideal é sempre UTF-8
PRAGMA encoding;

-- Exercícios
-- Crie uma tabela para armazenar os dados vindos de um formulário
-- de contatos simples com os campos: nome, email, assunto e mensagem.
-- Crie uma tabela "contacts" seguindo os padrões deste documento, para
-- armazenar esses contatos.
-- Adicione pelo menos 5 contatos e faça consultas para verificar a insersão.


-- apaga e cria a tabela "contacts
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	created_at TEXT DEFAULT CURRENT_TIMESTAMP,
	name TEXT NOT NULL,
	email TEXT NOT NULL,
	subject TEXT NOT NULL,
	message TEXT
);

-- Popula a tabela "contacts" com alguns registros
INSERT INTO contacts
	(name, email, subject, message)
VALUES
	("Mariangelico Futurgado", "mafutu@email.com", "Teste de contato", "Estou apenas testando seu contato."),
	("Semetéria Josefina", "josefa@email.com", "Falta do que fazer", "Não tenho o que fazer, por isso entrei em contato."),
	("Jerismaldo Cunhado Filho", "jecufilho@email.com", "Não é assim que frita", "Pra fritar o ovo tem que colocar no óleo quente."),
	("Mariangelico Futurgado", "mafutu@email.com", "Outro teste", "Mais uma vez, isso é apenas um teste."),
	("Cremivaldio Antagônico", "cremianta@email.com", "Como viro autor", "Quero escrever umas paradas nesse blog.");

SELECT * FROM contacts;	