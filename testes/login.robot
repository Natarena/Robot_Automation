*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Alurapic
Test Teardown     Fechar o navegador

*** Test Cases ***
Realizar login no Alurapic com sucesso
    Dado que eu preencha os campos obrigatorios
    E clique no botão "login"
    Então consigo acessar o Alurapic com sucesso

Validar campos de login obrigatórios
    E não insira usuario e nem senha então identificador com mensagem de campo obrigatorio é exibido
    E botão de "login" fica desabilitado

Validar login incorreto
    Dado que eu preencha os campos do formulário de forma incorreta
    Então login não é realizado

