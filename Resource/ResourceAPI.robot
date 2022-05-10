*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***

*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
    Create Session      fakeAPI     https://fakerestapi.azurewebsites.net/api/v1

#### Ações
Requisitar todos os livros
    ${RESPOSTA}     GET On Session     fakeAPI     Books
    Log     ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}     GET On Session     fakeAPI     Books/${ID_LIVRO}
    Log     ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

#### Conferências
Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be        ${RESPOSTA.json()}      ${QTDE_LIVROS}

Conferir se retorna Title "${TITULO_LIVRO}"
    Log     ${RESPOSTA.json()["title"]}
    Should Be Equal     ${RESPOSTA.json()["title"]}     ${TITULO_LIVRO}