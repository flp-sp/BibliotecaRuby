module View
  class View
    def construirTela
      puts "\n========================================\n"
      puts "1. Adicionar livro"
      puts "2. Listar livros"
      puts "3. Adicionar usuario"
      puts "4. Listar users"
      puts "5. Criar emprestimo"
      puts "6. Listar emprestimos"
      puts "0. Sair"
      opcao = gets.chomp
      return opcao
    end
  end
end