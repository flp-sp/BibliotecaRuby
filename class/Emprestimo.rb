module Emprestimo
  class Emprestimo
    def initialize(userId, livroId, dataEmprestimo, dataDevolucao, status)
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