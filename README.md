# qaX-Appium-Framework
Prejeto para armazernar o projeto de automação mobile com appium e robot framework desenvolvido no curso da QAX.

Para executar o projeto, como trata-se de um projeto acadêmico, primeiro é necessário executar a API do app, e ajustar no carquivo `resources/screens/login.resource` a variável API_IP passando o endereço de IP apresentado na execução da API.

Para executar a api, na pasta `apps\api` execute o comando `npm install` e depois `npm run dev`.

Com a API online, é necessário instalar as dependências do projeto com o comando `npm install` da pasta raiz do projeto.
    Este passo é necessário, pois foi optado manter o appium como uma instalação do projeto e não local, para o controle de versão.

Com as dependências instaladas, é ncessário executar o appium com o comando `npx appium`.

Antes da execução dos testes, é necessário também indicar no arquivo `./resources/base.resource` no parâmetro `udid` com o device android que será executado. Para saber qual é o device, execute o comando `adb devices`.

Com a API e o servidor appium executando, é possível executar os testes através do comando `robot -d ./logs tests`.