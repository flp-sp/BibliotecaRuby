module Emprestimo
  class Emprestimo
    attr_reader :id, :userId, :livroId, :dataEmprestimo, :dataDevolucao, :status

    def to_h
    {
      id: @id,
      userId: @userId, 
      livroId: @livroId, 
      dataEmprestimo: @dataEmprestimo, 
      dataDevolucao: @dataDevolucao, 
      status: @status
    }  
    end

    def initialize(id, userId, livroId, dataEmprestimo, dataDevolucao, status)
      @id = id
      @userId = userId
      @livroId = livroId
      @dataEmprestimo = dataEmprestimo
      @dataDevolucao = dataDevolucao
      @status = status
    end

    def criarRegistro
      @status = "emprestado"
    end

    def marcarDevolvido
      @status = "devolvido"
    end

    def verStatus
      @status
    end
  end
end