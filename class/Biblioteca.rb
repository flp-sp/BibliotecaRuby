module Biblioteca
  require_relative "./Book.rb"

  include Book

  class Biblioteca
    def initialize(listaUsers, listaEmprestimos, listaLivros)
      @listaUsers = listaUsers
      @listaEmprestimos = listaEmprestimos
      @listaLivros = listaLivros
    end
    
    def adicionarLivro(id, titulo, autor, ano, categoria, disponivel)
      novoLivro = Book::Book.new(id, titulo, autor, ano, categoria, disponivel)
      puts novoLivro.disponivel?
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