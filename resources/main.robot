*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR

### Shared ###
Resource    shared/setup_teardown.robot


### Pages ###
Resource    pages/dados_login.robot
Resource    pages/dados_cadastro.robot