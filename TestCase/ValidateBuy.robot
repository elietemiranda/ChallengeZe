*** Settings ***
Resource        ../resource/HomePageKeywords.robot
Resource        ../resource/CommonsPageKeywords.robot
Resource        ../resource/ProductsPageKeywords.robot
Library         Browser

Suite Setup     Abrir o navegador
Test Setup      Dado que a pagina inicial contenha o texto  Como funciona o Zé Delivery?

*** Test Cases ***
Cenario 1 - Validar se o zé trás uma mensagem para uma região que não é atendida
    Quando o usuario informa o cep  07700210
    Então o usuario recebe a seguinte mensagem  Ops! Não encontramos seu endereço...

Cenario 2 - Validar se o zé trás o informativo para menores de idade
    E que tenha preenchido uma região atendida pelo o Zé  13219071  300
    E que tenha clicado no botao "ver produtos disponíveis"
    Quando o usuario informa que é menor de idade
    Então é retornado a seguinte mensagem  Você precisa ter 18 anos ou mais para consumir bebidas alcoólicas.
