*** Settings ***
Resource  ../main.robot
Resource  ./dados_login.robot
Library    FakerLibrary  locale=pt-BR

*** Variables ***
${LINK_REGISTRO}               xpath=//a[@data-test='register']
${TITULO_TELA_REGISTRO}        xpath=//h4[@class='text-center']
${CAMPO_EMAIL}                 xpath=//input[@data-test='email']
${CAMPO_NOME}                  xpath=//input[@data-test='fullName']
${NICK_NAME}                   xpath=//input[@data-test='registerUserName']
${VALIDA_NICKNAME}             xpath=//small[@class='text-success']
${CAMPO_SENHA}                 xpath=//input[@data-test='registerPassword']
${BTN_REGISTRAR}               xpath=//button[@data-test='btnRegister']
${NOMEFAKE}                    FakerLibrary.Name
${EMAILFAKE}                   FakerLibrary.Email
${PASSWORDFAKE}                FakerLibrary.Password




*** Keywords ***
Dado que eu sou um novo usuario e deseje me registrar clicando em 'Registrar agora'
    Click Element    ${LINK_REGISTRO}
    Sleep    2s

Então uma nova tela com campos de cadastro é exibida

    Element Should Be Visible    ${TITULO_TELA_REGISTRO}

E preencho todos os campos obrigatorios para se registrar

    Input Text    ${CAMPO_EMAIL}    ${EMAILFAKE}
    Input Text    ${CAMPO_NOME}     ${NOMEFAKE}
    Input Text    ${NICK_NAME}      ${NOMEFAKE}
    Element Should Contain          ${VALIDA_NICKNAME}      User available
    Input Text    ${CAMPO_SENHA}    ${PASSWORDFAKE}

Então clico no botão 'Registrar'

    Click Button    ${BTN_REGISTRAR}
E verifica se tela é redirecionada para o login

    Element Should Be Visible    ${CAMPO_USER}