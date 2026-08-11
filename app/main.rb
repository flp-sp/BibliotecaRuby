require_relative "../class/Biblioteca.rb"
require_relative "View.rb"

include Biblioteca
include View

myLib = Biblioteca::Biblioteca.new
mainView = View::View.new

while true
  case mainView.construirTela
  when "1"
    puts "Insira o nome do livro:"
    nomeLivro = gets.chomp

    puts "Insira o nome do autor:"
    nomeAutor = gets.chomp

    puts "Insira o ano do livro:"
    ano = gets.chomp

    puts "Insira o genero do livro:"
    genero = gets.chomp

    myLib.adicionarLivro(nomeLivro, nomeAutor, ano, genero, true)

  when "2"
    myLib.listarLivros
  when "0"
    break
  end
end