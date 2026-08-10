module Biblioteca
  require_relative "/home/flp-sp/Projects/sandbox/ruby/BibliotecaRuby/class/Book.rb"

  include Book

  class Biblioteca
    def initialize(listaUsers, listaEmprestimos, listaLivros)
      @listaUsers = listaUsers
      @listaEmprestimos = listaEmprestimos
      @listaLivros = listaLivros
    end
    
    def adicionarLivro
      novoLivro = Book::Book.new(id, titulo, autor, ano, categoria, disponivel)
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