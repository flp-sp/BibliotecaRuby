module Biblioteca
  require_relative "./Book.rb"
  require "json"

  include Book

  class Biblioteca

    def initialize(booksDbPath = "data/books.json")
      @booksDbPath = booksDbPath
      @livros = carregarLivros
    end
    
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
      
      File.write(@booksDbPath, JSON.pretty_generate(livros))
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
      #puts @livros[0].id
    end

    def construirTela
      
    end
  end
end