CREATE TABLE [livros] (
	[id_livro] int IDENTITY(1,1) NOT NULL UNIQUE,
	[ISBN] nvarchar(20) NOT NULL UNIQUE,
	[titulo] nvarchar(150) NOT NULL,
	[ano_publicacao] int NOT NULL,
	[id_categoria] int NOT NULL,
	PRIMARY KEY ([id_livro])
);
CREATE TABLE [categoria] (
	[id_categoria] int IDENTITY(1,1) NOT NULL UNIQUE,
	[codigo_categoria] nvarchar(20) NOT NULL UNIQUE,
	[descricao] nvarchar(100) NOT NULL,
	[data_cadastro] date NOT NULL,
	[ativo] bit NOT NULL,
	PRIMARY KEY ([id_categoria])
);
CREATE TABLE [autor] (
	[id_autor] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome] nvarchar(100) NOT NULL,
	[nacionalidade] nvarchar(50) NOT NULL,
	[data_nascimento] date NOT NULL,
	[biografia_resumida] nvarchar(255),
	PRIMARY KEY ([id_autor])
);
CREATE TABLE [livro_autor] (
	[id_livro_autor] int IDENTITY(1,1) NOT NULL UNIQUE,
	[id_livro] int NOT NULL,
	[id_autor] int NOT NULL,
	[ordem_autor] int NOT NULL,
	[data_vinculo] date NOT NULL,
	PRIMARY KEY ([id_livro_autor])
);
CREATE TABLE [editora] (
	[id_editora] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nome_editora] nvarchar(100) NOT NULL,
	[telefone] nvarchar(20),
	[email] nvarchar(100),
	[cidade] nvarchar(50),
	PRIMARY KEY ([id_editora])
);
ALTER TABLE [livros] ADD CONSTRAINT [livros_fk0] FOREIGN KEY ([id_livro]) REFERENCES [livro_autor]([id_livro]);
ALTER TABLE [categoria] ADD CONSTRAINT [categoria_fk0] FOREIGN KEY ([id_categoria]) REFERENCES [livros]([id_categoria]);
ALTER TABLE [autor] ADD CONSTRAINT [autor_fk0] FOREIGN KEY ([id_autor]) REFERENCES [livro_autor]([id_autor]);