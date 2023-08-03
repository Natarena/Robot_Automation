*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o Alurapic
Test Teardown     Fechar o navegador

*** Test Cases ***
Realizar cadastro com sucesso
    Dado que eu sou um novo usuario e deseje me registrar clicando em 'Registrar agora'
    Então uma nova tela com campos de cadastro é exibida
    E preencho todos os campos obrigatorios para se registrar
    Então clico no botão 'Registrar'
    E verifica se tela é redirecionada para o login