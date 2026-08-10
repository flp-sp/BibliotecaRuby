module Book
  
  class Book
    def initialize(id, titulo, autor, ano, categoria, disponivel)
      @id = id
      @titulo = titulo
      @autor = autor
      @ano = ano
      @categoria = categoria
      @disponivel = disponivel
    end

    def emprestar
      @disponivel = false
    end

    def devolver
      @disponivel = true
    end

    def disponivel?
      @disponivel      
    end
  end
end