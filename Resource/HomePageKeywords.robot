*** Settings ***
Variables  ../Locators/HomePage.py

*** Keywords ***
#Condicoes
Dado que Leonardo esteja na tela principal
    Get Text    ${txt_title}  ==  Como funciona o Zé Delivery?

Dado que Joao tenha preenchido uma região atendida pelo o Zé
    Fill Region     13219071
    Search Region  ${adress_number}
    Fill Text  ${adress_number}  300
    Click  ${radio_button_complemento}

E que João tenha clicado no botao "ver produtos disponíveis"
    Click  ${bt_continue}

#Acoes
Quando Leonardo informa o cep
    [ARGUMENTS]  ${CEP}
    Fill Region  ${CEP}

#Validacoes
Então Leonardo recebe uma mensagem informando que o zé não atende na localidade dele
    Wait For Elements State  ${address_not_found}
    Get Text  ${address_not_found}  ==  Ops! Não encontramos seu endereço...
    Take Screenshot  filename=teste-leo

#Metodos
Fill Region
    [ARGUMENTS]  ${CEP}
    Click  ${address_fake_search}
    Fill Text  ${address_search}  ${CEP}
    Wait For Elements State  ${google_search_address}
    Click  ${google_search_address}

Search Region
    [ARGUMENTS]  ${ADRESS_NUMBER}
    Wait For Elements State   ${ADRESS_NUMBER}
    Click  ${ADRESS_NUMBER}
