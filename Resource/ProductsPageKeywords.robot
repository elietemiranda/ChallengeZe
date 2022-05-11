*** Settings ***
Variables  ../Locators/ProductsPage.py
Resource   ../Resource/HomePageKeywords.robot

*** Variables ***
${URL}   https://www.ze.delivery/produtos

*** Keywords ***
#Condicao
Dado que eu esteja na tela de produtos
    Go to page products

E que tenha informado que é maior de idade
    Get Text  ${TXT_MSG_AGE}  ==  Você tem 18 anos ou mais?
    Click  ${BTN_OF_AGE_YES}



#Acao
Quando o usuario informa que é menor de idade
    Get Text  ${TXT_MSG_AGE}  ==  Você tem 18 anos ou mais?
    Click  ${BTN_OF_AGE_NO}



#Validacao
Então é retornado a seguinte mensagem
    [ARGUMENTS]  ${msg_under_age}
    Wait For Elements State  ${TXT_MSG_UNDER_AGE}
    Get Text  ${TXT_MSG_UNDER_AGE}  ==  ${msg_under_age}



#Métodos
Go to page products
    E que tenha preenchido uma região atendida pelo o Zé  13219071  300
    E que tenha clicado no botao "ver produtos disponíveis"
    E que tenha informado que é maior de idade

