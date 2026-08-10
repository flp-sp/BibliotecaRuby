# Sistema de Gerenciamento de Biblioteca

Este projeto e uma aplicacao desenvolvida em ruby para gerenciamento de biblioteca, responsavel por controlar usuarios, livros e o historico de emprestimos e devolucoes.

---

## Arquitetura e Diagrama de Classes

O sistema esta estruturado em quatro classes principais que se relacionam para gerenciar a operacao do sistema:

### 1. Biblioteca
Atua como a classe gerenciadora principal, mantendo as colecoes de dados e a interface/fluxo do sistema.

* **Atributos:**
  * `listaUsers`: Lista de usuarios cadastrados.
  * `listaEmprestimos`: Lista de todos os emprestimos registrados.
  * `listaLivros`: Lista do acervo de livros.

* **Metodos:**
  * `adicionarLivro()`
  * `adicionarUser()`
  * `buscarLivro()`
  * `novoEmprestimo()`
  * `devolucao()`
  * `listarUsers()`
  * `listarLivros()`
  * `listarEmprestimos()`
  * `construirTela()`

---

### 2. User (Usuario)
Representa os leitores ou clientes cadastrados no sistema.

* **Atributos:**
  * `id`: Identificador unico do usuario.
  * `nome`: Nome do usuario.
  * `email`: Endereco de e-mail.
  * `listaEmprestadosUser`: Historico de emprestimos associados ao usuario.

* **Metodos:**
  * `emprestarLivro()`
  * `devolverLivro()`
  * `listarEmprestados()`

---

### 3. Livro
Representa as obras disponiveis no acervo da biblioteca.

* **Atributos:**
  * `id`: Identificador unico do livro.
  * `titulo`: Titulo da obra.
  * `autor`: Nome do autor.
  * `ano`: Ano de publicacao.
  * `categoria`: Categoria ou genero literario.
  * `disponivel`: Indicador de disponibilidade (booleano).

* **Metodos:**
  * `emprestar()`: Altera o estado do livro para emprestado.
  * `devolver()`: Altera o estado do livro para disponivel.
  * `disponivel?()`: Retorna o status atual de disponibilidade do livro.

---

### 4. Emprestimo
Classe intermediaria responsavel por registrar a transacao entre um `User` e um `Livro`.

* **Atributos:**
  * `userId`: Identificador do usuario solicitante.
  * `livroId`: Identificador do livro emprestado.
  * `dataEmprestimo`: Data em que o emprestimo foi efetuado.
  * `dataDevolucao`: Data limite ou efetiva de devolucao.
  * `status`: Situacao do emprestimo (ex: ativo, devolvido, atrasado).

* **Metodos:**
  * `criarRegistro()`: Registra a nova transacao de emprestimo.
  * `marcarDevolvido()`: Atualiza o status e a data de devolucao.
  * `verStatus()`: Consulta o status atual do emprestimo.

---

## Fluxo de Funcionamento

1. O gerenciador **Biblioteca** cadastra livros (`adicionarLivro`) e usuarios (`adicionarUser`).
2. Quando um usuario solicita um exemplar, o metodo `novoEmprestimo` cria uma instancia da classe **Emprestimo**.
3. O status do **Livro** e atualizado para indisponivel (`emprestar()`).
4. Ao realizar a devolução via `devolucao()`, o registro e atualizado (`marcarDevolvido()`) e o livro volta a ficar disponivel (`devolver()`).