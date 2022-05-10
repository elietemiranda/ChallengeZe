*** Settings ***
Variables  ../Locators/ProductsPage.py

*** Keywords ***
#Condicao
Dado que Isabela tenha selecionado 6 unidade de skol

#Acao
Quando o usuario informa que é menor de idade
    Get Text  ${TXT_MSG_AGE}  ==  Você tem 18 anos ou mais?
    Click  ${BT_OF_AGE_NO}

#Validacao
Então é retornado a seguinte mensagem
    [ARGUMENTS]  ${msg_under_age}
    Wait For Elements State  ${TXT_MSG_UNDER_AGE}
    Get Text  ${TXT_MSG_UNDER_AGE}  ==  ${msg_under_age}


