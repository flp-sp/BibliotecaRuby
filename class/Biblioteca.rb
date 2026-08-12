module Biblioteca
  require_relative "./Book.rb"
  require_relative "./User.rb"
  require_relative "./Emprestimo.rb"

  require "json"
  require "date"

  include Book
  include User
  include Emprestimo

  class Biblioteca

    def initialize(booksDbPath = "data/books.json", usersDbPath = "data/users.json", emprestimosDbPath = "data/emprestimos.json")
      @booksDbPath = booksDbPath # caminho do banco dos livros
      @usersDbPath = usersDbPath # caminho do banco dos users
      @emprestimosDbPath = emprestimosDbPath # caminho do banco dos emprestimos

      @livros = carregarLivros # array que guarda os objetos Books
      @users = carregarUsers # array que guarda os objetos Users
      @emprestimos = carregarEmprestimos # array que guarda os objetos Emprestimos
    end
    
    # instancia os livros salvos em objetos
    def carregarLivros
      if !File.exist?(@booksDbPath) || File.empty?(@booksDbPath)
        return []
      end

      conteudo_json = File.read(@booksDbPath)
      dados_livros = JSON.parse(conteudo_json, symbolize_names: true)

      dados_array = dados_livros.is_a?(Array) ? dados_livros : [dados_livros]

      dados_array.map do |dados|
        Book::Book.new(
          dados[:id],
          dados[:titulo],
          dados[:autor],
          dados[:ano],
          dados[:categoria],
          dados[:disponivel]
        )
      end
    end

    # adiciona um livro no banco
    def adicionarLivro(titulo, autor, ano, categoria, disponivel)
      livros = if File.exist?(@booksDbPath) && !File.empty?(@booksDbPath)
                JSON.parse(File.read(@booksDbPath))
              else
                []
              end

      lastBook = livros.last
      lastId = if livros.empty?
                  0
                else
                  lastBook["id"]
                end
      newBook = Book::Book.new(lastId += 1, titulo, autor, ano, categoria, disponivel)

      livros << newBook.to_h
      @livros << newBook
      
      File.write(@booksDbPath, JSON.pretty_generate(livros))
    end


    def carregarUsers
      if !File.exist?(@usersDbPath) || File.empty?(@usersDbPath)
        return []
      end

      conteudo_json = File.read(@usersDbPath)
      dados_users = JSON.parse(conteudo_json, symbolize_names: true)

      dados_array = dados_users.is_a?(Array) ? dados_users : [dados_users]

      dados_array.map do |dados|
        User::User.new(
          dados[:id],
          dados[:nome],
          dados[:email],
          dados[:listaEmprestadosUser]
        )
      end
    end


    def adicionarUser(nome, email)
      users = if File.exist?(@usersDbPath) && !File.empty?(@usersDbPath)
                JSON.parse(File.read(@usersDbPath))
              else
                []
              end

      lastUser = users.last
      lastId = if users.empty?
                  0
                else
                  lastUser["id"]
                end
      newUser = User::User.new(lastId += 1, nome, email, [])

      users << newUser.to_h
      @users << newUser
      
      File.write(@usersDbPath, JSON.pretty_generate(users))
    end


    def buscarLivro
      
    end


    def carregarEmprestimos
      if !File.exist?(@emprestimosDbPath) || File.empty?(@emprestimosDbPath)
        return []
      end

      conteudo_json = File.read(@emprestimosDbPath)
      dados_emprestimos = JSON.parse(conteudo_json, symbolize_names: true)

      dados_array = dados_emprestimos.is_a?(Array) ? dados_emprestimos : [dados_emprestimos]

      dados_array.map do |dados|
        Emprestimo::Emprestimo.new(
          dados[:id],
          dados[:userId], 
          dados[:livroId], 
          dados[:dataEmprestimo], 
          dados[:dataDevolucao], 
          dados[:status]
        )
      end
    end


    def novoEmprestimo(userId ,livroId)
      emprestimos = if File.exist?(@emprestimosDbPath) && !File.empty?(@emprestimosDbPath)
                JSON.parse(File.read(@emprestimosDbPath))
              else
                []
              end

      lastEmprestimo = emprestimos.last
      lastId = if emprestimos.empty?
                  0
                else
                  lastEmprestimo["id"]
                end
      newEmprestimo = Emprestimo::Emprestimo.new(lastId += 1, userId ,livroId, Date.today, Date.today + 5, "No prazo")

      emprestimos << newEmprestimo.to_h
      @emprestimos << newEmprestimo
      
      File.write(@emprestimosDbPath, JSON.pretty_generate(emprestimos))
    end


    def devolucao
      
    end


    def listarUsers
      if @users.respond_to?("each")
        @users.each do |user|
          puts "\n========================================\n"
          puts user.id
          puts user.nome
          puts user.email
          puts user.listaEmprestadosUser
        end
      end
    end


    def listarEmprestimos
      if @emprestimos.respond_to?("each")
        @emprestimos.each do |emprestimo|
          puts "\n========================================\n"
          puts emprestimo.id
          puts emprestimo.userId
          puts emprestimo.livroId
          puts emprestimo.dataEmprestimo
          puts emprestimo.dataDevolucao
          puts emprestimo.status
        end
      end
    end


    def listarLivros
      if @livros.respond_to?("each")
        @livros.each do |livro|
          puts "\n========================================\n"
          puts livro.id
          puts livro.titulo
          puts livro.autor
          puts livro.ano
          puts livro.categoria
          puts livro.disponivel
        end
      end
    end
  end
end