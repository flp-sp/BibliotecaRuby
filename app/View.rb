module View
  class View
    def construirTela
      puts "\n========================================\n"
      puts "1. Adicionar livro\n2. Listar livros\n0. Sair"
      opcao = gets.chomp
      return opcao
    end
  end
end