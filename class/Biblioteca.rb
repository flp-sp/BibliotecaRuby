module Biblioteca
  require_relative "./Book.rb"
  require "json"

  include Book

  class Biblioteca

    def initialize(listaUsers, listaEmprestimos, listaLivros)
      @listaUsers = listaUsers
      @listaEmprestimos = listaEmprestimos
      @listaLivros = listaLivros
    end
    
    def adicionarLivro(titulo, autor, ano, categoria, disponivel)
      booksDbPath = "data/books.json"
      livros = if File.exist?(booksDbPath) && !File.empty?(booksDbPath)
                JSON.parse(File.read(booksDbPath))
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
      
      File.write(booksDbPath, JSON.pretty_generate(livros))
    end

    def adicionarUser
      
    end

    def buscarLivro
      
    end

    def novoEmprestimo
      
    end

    def devolucao
      
    end

    def listarUsers
      
    end

    def listarEmprestimos
      
    end

    def listarLivros
      
    end

    def construirTela
      
    end
  end
end