*** Settings ***
Resource            ../resource/MainPageKeywords.robot
Resource            ../resource/CommonsPageKeywords.robot
Resource             ../resource/ProductsPageKeywords.robot
Library             Browser
Test Setup          Acessar site do zé delivery

#Test Teardown       Fechar navegador

*** Test Cases ***
Cenario 1 - Validar se o zé trás uma mensagem para uma região que não é atendida
    Dado que Leonardo esteja na tela principal
    Quando Leonardo informa o cep  07700210
    Então Leonardo recebe uma mensagem informando que o zé não atende na localidade dele
