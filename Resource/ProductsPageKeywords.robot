*** Settings ***
Variables  ../Locators/ProductsPage.py

*** Keywords ***
Quando Joao informa que é menor de idade
    Get Text  ${txt_msg_idade}  ==  Você tem 18 anos ou mais?
    Click  ${bt_age_gate_button_yes}
