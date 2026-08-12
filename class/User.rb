module User
  class User
    attr_reader :id, :nome, :email, :listaEmprestadosUser

    def to_h
      {
        id: @id,
        nome: @nome,
        email: @email,
        listaEmprestadosUser: @listaEmprestadosUser
      }
    end

    def initialize(id, nome, email, listaEmprestadosUser)
      @id = id
      @nome = nome
      @email = email
      @listaEmprestadosUser = listaEmprestadosUser
    end

    # apenas para alterar a variavel [listaEmprestadosUser]
    def emprestarLivro(idLivro)
      
    end

    def devolverLivro(idLivro)
      
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