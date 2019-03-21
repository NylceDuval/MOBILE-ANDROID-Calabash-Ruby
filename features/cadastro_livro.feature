# language: pt
# enconding: utf-8

Funcionalidade: Cadastro de livro

@android
Cenario: Cadastrar novo livro
  Dado eu deveria ver "Cadastrar um novo livro"
  Quando eu entro o texto "Harry Potter e a Pedra Filosofal" no campo com id "title_field"
  E eu entro o texto "J. K. Rowling" no campo com id "author_field"
  E eu entro o texto "Rocco" no campo com id "publishing_field"
  E eu entro o numero "2017" no campo com id "year_field"
  E eu entro o numero "208" no campo com id "pages_field"
  E eu pressiono o botao "Salvar"
  Então eu deveria ver "Título:"
  E eu deveria ver "Harry Potter e a Pedra Filosofal"
  E eu deveria ver "Autor:"
  E eu deveria ver "J. K. Rowling"
  E eu deveria ver "Editora:"
  E eu deveria ver "Rocco"
  E eu deveria ver "Ano de publicação:"
  E eu deveria ver "2017"
  E eu deveria ver "Número de páginas:"
  E eu deveria ver "208"
