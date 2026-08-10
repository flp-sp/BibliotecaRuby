module User
  class User
    def initialize(id, nome, email, listaEmprestadosUser)
      @id = id
      @nome = nome
      @email = email
      @listaEmprestadosUser = listaEmprestadosUser
    end

    def emprestarLivro
      
    end

    def devolverLivro
      
    end

    def listarEmprestados
      if @listaEmprestadosUser.responds_to?("each")
        @listaEmprestadosUser.each do |emprestado|
          puts "- #{emprestado}"
        end
      end
    end
    
  end
end