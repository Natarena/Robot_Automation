*** Settings ***
Resource          ../main.robot

*** Keywords ***
Dado que eu acesse o Alurapic
    Open Browser    url=https://3076-cypress-alurapic-front.vercel.app/#/home   browser=Firefox
    sleep  3s

Fechar o navegador
    Close Browser