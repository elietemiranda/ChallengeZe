*** Settings ***
Resource            ../resource/MainPageKeywords.robot
Resource            ../resource/CommonsPageKeywords.robot
Resource             ../resource/ProductsPageKeywords.robot

Library             Browser
Test Setup          Acessar site do zé delivery

*** Test Cases ***
Cenario 1 - Validar se o zé trás uma mensagem para uma região que não é atendida
    Dado que Leonardo esteja na tela principal
    Quando Leonardo informa o cep  07700210
    Então Leonardo recebe uma mensagem informando que o zé não atende na localidade dele

Cenario 2 - Validar se o zé trás o informativo para menores de idade
    Dado que Joao tenha preenchido uma região atendida pelo o Zé
    E que João tenha clicado no botao "ver produtos disponíveis"
    Quando Joao informa que é menor de idade
    Então é retornado a informação que o usuario precisa ter 18 anos ou mais para consumir bebidas alcoólicas