class Livro:
    def __init__(self, titulo, autor, ano_publicacao, isbn, emprestado=False):
        self.titulo = titulo
        self.autor = autor
        self.ano_publicacao = ano_publicacao
        self.isbn = isbn
        self.emprestado = emprestado

    def emprestar(self):
        if not self.emprestado:
            self.emprestado = True
            print(f"O livro '{self.titulo}' foi emprestado com sucesso.")
        else:
            print(f"Desculpe, o livro '{self.titulo}' já está emprestado.")

    def devolver(self):
        if self.emprestado:
            self.emprestado = False
            print(f"O livro '{self.titulo}' foi devolvido.")
        else:
            print(f"Este livro '{self.titulo}' não estava emprestado.")

    def detalhes(self):
        status = "Disponível" if not self.emprestado else "Emprestado"
        print(f"Título: {self.titulo}")
        print(f"Autor: {self.autor}")
        print(f"Ano de Publicação: {self.ano_publicacao}")
        print(f"ISBN: {self.isbn}")
        print(f"Status: {status}")

class Usuario:
    def __init__(self, nome, idade, id_usuario):
        self.nome = nome
        self.idade = idade
        self.id_usuario = id_usuario
        self.livros_emprestados = []

    def emprestar_livro(self, livro):
        if len(self.livros_emprestados) < 3:
            livro.emprestar()
            self.livros_emprestados.append(livro)
        else:
            print("Desculpe, você já atingiu o limite máximo de livros emprestados.")

    def devolver_livro(self, livro):
        if livro in self.livros_emprestados:
            livro.devolver()
            self.livros_emprestados.remove(livro)
        else:
            print("Você não possui este livro emprestado.")

    def detalhes(self):
        print(f"Nome: {self.nome}")
        print(f"Idade: {self.idade}")
        print(f"ID de Usuário: {self.id_usuario}")
        print("Livros Emprestados:")
        if self.livros_emprestados:
            for livro in self.livros_emprestados:
                print(f"- {livro.titulo}")
        else:
            print("Nenhum livro emprestado.")


class Biblioteca:
    def __init__(self):
        self.livros = []
        self.usuarios = []

    def adicionar_livro(self, livro):
        self.livros.append(livro)
        print(f"O livro '{livro.titulo}' foi adicionado à biblioteca.")

    def adicionar_usuario(self, usuario):
        self.usuarios.append(usuario)
        print(f"O usuário '{usuario.nome}' foi registrado na biblioteca.")

    def listar_livros_disponiveis(self):
        print("Livros disponíveis na biblioteca:")
        for livro in self.livros:
            if not livro.emprestado:
                livro.detalhes()

    def listar_usuarios(self):
        print("Usuários registrados na biblioteca:")
        for usuario in self.usuarios:
            usuario.detalhes()
