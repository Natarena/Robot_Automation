*** Settings ***
Resource  ../main.robot

*** Variables ***
${CAMPO_USER}                  xpath=//input[@data-test='loginUserName']
${MSG_USER_OBRIGATORIO}        xpath=//div[1]/ap-vmessage[@text='User name is required!']
${CAMPO_PASSWORD}              xpath=//input[@data-test='loginPassword']
${MSG_PASSWORD_OBRIGATORIO}    xpath=//div[2]/ng-component/form/div[2]/ap-vmessage[@text='Password is required!']
${BOTAO_LOGIN}                 xpath=//button[@data-test='loginBtn']
${USER_LOGADO}                 class:mr-1


*** Keywords ***
Dado que eu preencha os campos obrigatorios

    Input Text    ${CAMPO_USER}    nathaliacr
    Sleep    3s
    Input Text    ${CAMPO_PASSWORD}     12345678

E clique no botão "login"

    Click Element     ${BOTAO_LOGIN}
    Sleep    3s

Então consigo acessar o Alurapic com sucesso

    Element Should Be Visible      ${USER_LOGADO}
    Element Should Contain         ${USER_LOGADO}    nathaliacr

E não insira usuario e nem senha então identificador com mensagem de campo obrigatorio é exibido

    Element Should Contain    ${MSG_USER_OBRIGATORIO}    User name is required!
    Element Should Contain    ${MSG_PASSWORD_OBRIGATORIO}    Password is required!
E botão de "login" fica desabilitado

    Element Should Be Disabled    ${USER_LOGADO}

Dado que eu preencha os campos do formulário de forma incorreta

    Input Text     ${CAMPO_USER}         usuario_error
    Input Text     ${CAMPO_PASSWORD}     12345678

Então login não é realizado

    Element Should Not Be Visible      ${USER_LOGADO}

