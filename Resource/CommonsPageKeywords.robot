*** Settings ***
#Test Teardown       Fechar pagina

*** Keywords ***
Abrir o navegador
    New Browser  browser=Chromium

Abrir navegador na pagina do zé
    Open Browser   browser=headlessfirefox  url=https://www.ze.delivery/

Fechar pagina
    Close Page
