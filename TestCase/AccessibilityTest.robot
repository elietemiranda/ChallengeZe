*** Settings ***
Resource        ../Resource/AccessibilityKeywords.robot
Resource        ../Resource/CommonsPageKeywords.robot

Library         SeleniumLibrary
Library         AxeLibrary
Suite Setup     Abrir navegador na pagina do zé

*** Test Cases ***
Cenario 1 - Validar se a pagina do zé delivery esta no padrão de acessibilidade
    Quando eu executo a validação de acessibilidade
    Então é retornado o resultado da violação

