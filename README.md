# ProjetoMP
Repositório para o projeto final da disciplina de Métodos de Programação

Link para este repositório: https://github.com/afgmlff/monitoria

## Integrantes

Nome | Matrícula
--- | ---
Aécio Fernandes Galiza Magalhães | 15/0115121
Alexander Matheus de Melo Lima | 12/0108534
Eduardo Marques dos Reis | 19/0012358
João Victor Novais Magalhães | 18/0033816
Emanoel Johannes Cardim Lazaro | 170140997
Mariana Borges de Sampaio | 180046926

## Descrição do Projeto

O projeto é uma aplicação web onde os monitores podem se cadastrar e acessar cada uma das disciplinas de seu departamento. Como monitor de uma disciplina, ele poderá agenda uma monitoria adicionando informações como link para a reunião, dia, horário e o que será estudado.

## Instruções para instalação
### Rails
Primeiro, deve ser instalado o framework Rails, de acordo com seu sistema operacional:

Sistema | Link para instalação do Rails
--- | ---
Linux | http://guides.railsgirls.com/install#setup-for-linux
Windows | http://installrails.com/steps/railsinstaller_windows
macOS | http://installrails.com/steps/choose_os_version

### Banco de Dados
É necessário instalar o Postgres, sistema gerenciador de banco de dados utilizado no projeto. Em ambiente Linux, sua presença pode ser verificada com o comando:
    
    $ psql -V

### App Monitoria
Verificada a instalação do Rails, basta clonar este repositório em um diretório local e executar os seguintes comandos (dentro do diretório clonado):

    $ bundle install
    $ rails db:drop
    $ rails db:create
    $ rails db:migrate
    
Nota: Em casos de reinstalação do repositório, caso ocorra algum erro relacionado a impossibilidade de "db:drop" pelo fato do Postgres estar utilizando a base, basta executar o comando:
    
    $ sudo service postgresql restart


Após os passos acima, você deve ser capaz de iniciar o servidor a partir do comando:

    $ rails server
    
Onde será exibida a rota em que o servidor estará rodando, bem como a porta definida. Agora, basta apenas acessar o endereço pelo navegador.

## Linguagem

### Front end
a) Embedded Ruby

b) HTML

c) CSS

### Back end
a) Ruby on Rails

b) Postgres
  
### Framework de testes
Rspec: https://github.com/rspec/rspec-rails
Para verificar os testes, basta executar:

    $ rspec

na raiz do repositório.

### Bibliotecas e Frameworks de teste
Rspec: https://github.com/rspec/rspec-rails

### Cobertura de testes
simpleCov: https://github.com/simplecov-ruby/simplecov

Ao executar os códigos com o rspec, é gerada uma pasta "coverage" na raiz do repositório, com os arquivos de cobertura.

### Verificador de Código (estático e padrão de codificação)
Rubocop: https://github.com/rubocop-hq/rubocop

### Documentação
Rdoc: https://github.com/ruby/rdoc
Para gerar a documentação, basta executar:

    $ rdoc
    
dentro da pasta "/app" do repositório (referente à aplicação em si), e os arquivos serão gerados na pasta app/Doc

### Controle de versão
  Github
  
### Metodologia ágil
  Trello

