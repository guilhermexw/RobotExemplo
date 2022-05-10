*** Settings ***
Resource        ../Resource/ResourceAPI.robot
Suite Setup     Conectar a minha API


*** Test Case ***
Buscar a listagem de todos os livros (GET em todos os livros)
   Requisitar todos os livros
   Conferir se retorna uma lista com "200" livros

Buscar um livro específico (GET em um livro específico)
   Requisitar o livro "15"
   Conferir se retorna title "Book 15"