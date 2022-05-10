*** Settings ***
Variables  ../Locators/DeliveryProductPage.py
Resource   ../resource/HomePageKeywords.robot

*** Keywords ***
#Condicao
E que tenha selecionado uma quantidade de itens na sacola
    [ARGUMENTS]  ${product_name}  ${qtd_items}
    Search products  ${product_name}
    Select items  ${qtd_items}

#Acao
Quando abre a sacola
    Wait For Elements State  ${PAGE_BAG}  state=visible


#Validacao
Então é exibido a quantidade de itens da skol
    Wait For Elements State  ${TXT_AMOUNT_PRODUCT}
    Get Text  ${TXT_AMOUNT_PRODUCT}  ==  7 produtos


Então é exibido a mensagem
    [ARGUMENTS]  ${msg}
    Get Text  ${MSG_MINIMUM_VALUE}  *=  ${msg}
    Take screen shot  teseleo.png

#Métodos
Search products
    [ARGUMENTS]  ${product_name}
    Click  ${INPUT_SEARCH_PRODUCT}
    Fill Text  ${INPUT_SEARCH_PRODUCT}   ${product_name}
    Click  ${SELECT_PRODUCT_SKOL}

Select items
    [ARGUMENTS]  ${qtd_items}
    Click  ${BTN_SELECT_MORE_ITENS}  clickCount=${qtd_items}
    Click  ${BTN_SELECT_LESS_ITENS}
    Click  ${BTN_ADD_PRODUCT}