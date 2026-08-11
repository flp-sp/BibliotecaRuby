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
    
    def adicionarLivro(id, titulo, autor, ano, categoria, disponivel)
      newBook = Book::Book.new(id, titulo, autor, ano, categoria, disponivel)
      livroJson = JSON.generate(newBook.to_h)
      File.write("data/books.json", livroJson)
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