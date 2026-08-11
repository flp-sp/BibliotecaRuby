require_relative "../class/Biblioteca.rb"

include Biblioteca

myLib = Biblioteca::Biblioteca.new(nil, nil, nil)

myLib.adicionarLivro("Dom Casmurro", "Machado de Assis", 1899, "Romance", true)