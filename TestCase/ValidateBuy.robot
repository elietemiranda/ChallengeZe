*** Settings ***
Resource            Resource/HomePageKeywords.robot
Resource            Resource/CommonsPageKeywords.robot
Resource            Resource/ProductsPageKeywords.robot
Resource            Resource/DeliveryProductPageKeywords.robot

Library             Browser

Suite Setup         Abrir o navegador
Test Setup          Acessar pagina inicial


*** Test Cases ***
Cenario 1 - Validar se o zé trás uma mensagem para uma região que não é atendida
    Quando o usuario informa o cep  07700210
    Então o usuario recebe a seguinte mensagem  Ops! Não encontramos seu endereço...

Cenario 2 - Validar se o zé trás o informativo para menores de idade
    E que tenha preenchido uma região atendida pelo o Zé  13219071  300
    E que tenha clicado no botao "ver produtos disponíveis"
    Quando o usuario informa que é menor de idade
    Então é retornado a seguinte mensagem  Você precisa ter 18 anos ou mais para consumir bebidas alcoólicas.

Cenario 3 - Validar se a sacola mostra a quantidade de itens que o usuario inseriu
     Dado que eu esteja na tela de produtos
     E que tenha selecionado uma quantidade de itens na sacola  skol  7
     Quando abre a sacola
     Então é exibido a quantidade de itens da skol

Cenario 4 - Validar se é informado a mensagem que o usuario ainda não inseriu o valor mínimo
    Dado que eu esteja na tela de produtos
    E que tenha selecionado uma quantidade de itens na sacola  skol  2
    Quando abre a sacola
    Então é exibido a mensagem  Faltam R$ 10,22 para o valor mínimo do pedido