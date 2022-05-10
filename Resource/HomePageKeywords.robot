*** Settings ***
Variables  ../Locators/HomePage.py

*** Variables ***
${URL_HOME_PAGE}   https://www.ze.delivery

*** Keywords ***
#Condicoes
Acessar pagina inicial
    Set Local Variable   ${title}  Como funciona o Zé Delivery?
    New page     ${URL_HOME_PAGE}
    Get Text    ${TXT_HOW_IT_WORKS_TITLE}  ==  ${title}

E que tenha preenchido uma região atendida pelo o Zé
    [ARGUMENTS]  ${cep}  ${number}
    Fill Region     ${cep}
    Search Region  ${INPUT_ADDRESS_DETAILS_NUMBER}
    Fill Text  ${INPUT_ADDRESS_DETAILS_NUMBER}  ${number}
    Click  ${RB_COMPLEMENT}

E que tenha clicado no botao "ver produtos disponíveis"
    Click  ${BT_ADDRESS_DETAILS_CONTINUE}

#Acoes
Quando o usuario informa o cep
    [ARGUMENTS]  ${CEP}
    Fill Region  ${CEP}

#Validacoes
Então o usuario recebe a seguinte mensagem
    [ARGUMENTS]  ${title_not_found}
    Wait For Elements State  ${TXT_ADDRESS_NOT_FOUND}
    Get Text  ${TXT_ADDRESS_NOT_FOUND}  ==  ${title_not_found}

#Metodos
Fill Region
    [ARGUMENTS]  ${cep}
    Click  ${INPUT_ADDRESS_FAKE_SEARCH}
    Fill Text  ${INPUT_ADDRESS_SEARCH}  ${cep}
    Wait For Elements State  ${TXT_GOOGLE_ADDRESS}
    Click  ${TXT_GOOGLE_ADDRESS}

Search Region
    [ARGUMENTS]  ${address_number}
    Wait For Elements State   ${address_number}
    Click  ${address_number}
