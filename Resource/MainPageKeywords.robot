*** Settings ***
Variables  ../Locators/MainPage.py

*** Keywords ***
#Condicoes
Dado que Leonardo esteja na tela principal
    Get Text    ${title}  ==  Como funciona o Zé Delivery?

Dado que Joao tenha preenchido uma região atendida pelo o Zé
    Preencher regiao  13219071
    Wait For Elements State   ${adress_number}
    Click  ${adress_number}
    Fill Text  ${adress_number}  300
    Click  ${radio_button_complemento}

E que João tenha clicado no botao "ver produtos disponíveis"
    Click  ${bt_continue}

#Acoes
Quando Leonardo informa o cep
    [ARGUMENTS]  ${CEP}
    Preencher regiao  ${CEP}

#Validacoes
Então Leonardo recebe uma mensagem informando que o zé não atende na localidade dele
    Wait For Elements State  ${address_not_found}
    Get Text  ${address_not_found}  ==  Ops! Não encontramos seu endereço...
    Take Screenshot  filename=teste-leo

#Metodos
Preencher regiao
    [ARGUMENTS]  ${CEP}
    Click  ${address_fake_search}
    Fill Text  ${address_search}  ${CEP}
    Wait For Elements State  ${google_search_address}
    Click  ${google_search_address}