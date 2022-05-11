<h1 align="center">
    Zé Delivery Code Challenge
</h1>

## Sobre o Desafio

Não queremos que os nossos clientes tenham problemas e bugs ao utilizar a nossa plataforma Zé Delivery. Principalmente nesse momento super importante, que é quando ele escolhe uma cerveja gelada para degustar na hora.
 
Bem, tendo isso em mente, devemos implementar alguns testes para minimizar esse risco:

### 1. Identifique os fluxos críticos

Você notará que nossas plataformas web e mobile são um pouco diferentes, portanto, para esta primeira parte do desafio do código, você pode escolher um dos 3 aplicativos que temos: Android, iOS, Web.
 
i. Identifique no mínimo, 3 fluxos importantes que mantêm o aplicativo funcionando corretamente. Por exemplo: Login (Login é um fluxo importante porque o usuário precisa estar logado para concluir uma compra). Como foi dado como exemplo, agora não vale usar o login no teste heinn :p
 
ii. Forneça uma explicação detalhada de por que esses fluxos são importantes para que o usuário possa comprar seus produtos.


### 2. Teste Automatizado de WEB
Em nossa [Aplicação da Web](https://www.ze.delivery/), crie uma suite de testes de automação para um cenário da parte 1 do desafio de código (escolha um dos 3 fluxos que você criou em `1. Identifique os fluxos críticos`).




### Planejamento do projeto
Antes de criar qualquer tipo de automação iniciei o planejamento do projeto como se realmente fosse uma equipe trabalhando para desenvolver
uma história e com isso, criei uma história no jira utilizando as boas práticas do BDD e ATDD.

Para ter acesso a história será necessário me passar o e-mail, pois criei a história no meu jira
[Ir para a Historia do Usuario](https://leoteste.atlassian.net/browse/CHAL-2)

Obs: Notei que todo o fluxo que o usuario passa na plataforme tem uma certa criticidade, 
então por isso pensei em criar uma história para atendermos um denominado fluxo.<br>
Um dos fluxos que vejo como critico é a tela de cadastro, pois se o usuário tiver que preencher muitas informações 
e ter algum problema na hora de criar sua conta, ele pode desistir de abrir uma conta no Zé.


### Explicacao sobre a estrutura do projeto
O projeto foi desenvolvido com Robot Framework utilizando a library da brownser para automação dos fluxos críticos do Zé e para automação da validação de acessbilidade foi utilizado o Robot com Selenium e a library AxesLibrary.

#### Estrutura dos testes

    ├── .github                   
        ├── gitflows                            # Diretório de arquivos para rodar a pipeline
    ├── Locators                                # Diretório para armazenar os elementos buscado na tela
    ├── Resource                                # Diretório comas classes .robot que roda as keywords  
    ├── TestCase                                # Diretório para armazernar os cenários de testes  
        ├── AccessibilityTest.robot             # Validação dos testes de acessibilidade para saber o quanto nossa pagina é acessível
        ├── ValidateBuy.robot                   # Test Case para valdiar o fluxo de compra na pagina
    └── README.md                               # Documentação do projeto

### Por quê utilizar o Robot Framework?
Durante algumas techs apresentadas pelo o Zé delivery notei que é utilizado muito desenvolvimento com python então resolvi trazer um viés de utilizarmos um framework mais próximo dessa linguagem,
com isso pensei no robot. <br>
Utilizo muito o robot no meu dia a dia e vejo que ele é um framework muito fácil de automatizar! E além dessa facilidade ele pode ser utilizado em 
diversas camadas, como em backend, frontend e APPs!


### 1. Fluxos Críticos

#### I - Endereço
A validação de endereço ja aparece no home page do zé, vejo que é um fluxo importante pois é uma etapa onde o usuário vai saber 
se a região que ele esta localizado é atendida pelo o zé.
Se o usuário soubesse que a região que ele esta localizado não é atendida pelo o zé somente no final da compra,
iria gerar uma péssima experiência para o usuário que esta tendo o primeiro contato na plataforma.

#### II - Proibição de vendas de bebidas alcoólicas para menores de idade
Uma etapa bem importante, pois já mostra antes de qualquer compra que o Zé delivery não vende bebida para menores de idade, 
já imaginou termos um problema judicial caso não tivesse essa validação e informação na plataforma? 

#### III - Sacola de compras
Uma etapa super importante, pois é aonde o usuário consegue montar a sua sacola com todos os produtos que ele optou pela compra, 
então vejo que é uma das funcionalidades mais importante na jornada de compras do Zé

#### IV - Acessibilidade
Coloquei um cenário bônus pois vejo que essa funcionalidade deveria ser muito pertinente nos aplicativos hoje em dia 
e visto que o Zé apoia ter um mundo mais acessível, por que não vermos o quanto nosso aplicativo é acessível para um portador 
de deficiência? Afinal, a boa experiência que o zé quer passar deve ser para todos.

### Continuos Test
Além de criarmos nossa automação é necessário rodarmos ela em uma PIPE certo? Então desenvolvi o github actions para rodar nosso projeto de automação 
a cada PUSH que fazemos no nosso repo, para rodar o projeto no github é só rodar no menu de Actions!

A nossa pipeline se integra com a AWS para armazenar o resultado do testes em um Bucket S3!

### Configurando o projeto na sua máquina Windows
Para rodar o projeto na sua máquina será necessário ter as seguintes depedências:

- Ter uma IDE de sua preferência
- Python instalado: [Site de instalacao do python](https://www.python.org/downloads/)

> Copie o projeto
```
git clone https://github.com/leonardodossantos2012/ChallengeZe.git
```

> Instalar as dependencia do robot no seu terminal
```
cd C:\{PATH}\ChallengeZe
pip3 install -r .\requirements.txt
webdrivermanager firefox chrome --linkpath /usr/local/bin
```

### Executando o projeto
> Acessar a pasta do projeto e executar o comando no seu terminal
```
robot -d ./results .\TestCase
```
