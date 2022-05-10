*** Keywords ***
Quando eu executo a validação de acessibilidade
   # execute accessibility tests
   &{results}=    Run Accessibility Tests    resultsAcessibility\HomePageZE.json
   Log   Violations Count: ${results.violations}

Então é retornado o resultado da violação
   # log violation result to log.html
   Log Readable Accessibility Result    violations
   [Teardown]    Close All Browsers
