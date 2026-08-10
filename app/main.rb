require_relative "../class/Biblioteca.rb"

include Biblioteca

myLib = Biblioteca::Biblioteca.new(nil, nil, nil)

myLib.adicionarLivro(21, "titulo", "autor", 1222, "categoria", true)