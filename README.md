# Boilerplate para Wordpress

Estrutura base para projetos em Wordpress

| Software | Versão |
|----------|--------|
| PHP      | 8.1    |
| Mariadb  | 10.9.5 |
| Wordpress| 6.1.1  |
| Nginx    | 1.23.3 |


## Requisitos

Exemplo:
- Docker (https://docs.docker.com/install/)
- Docker Compose (https://docs.docker.com/compose/install/)
- Make (https://www.gnu.org/software/make/)

## Como instalar

Descreva o passo a passo de como instalar o projeto aqui

Exemplo:
- Clone o projeto e acesse a pasta do projeto
- Copie o arquivo `.env.example` para `.env`
- Edite o arquivo `.env` e altere as variáveis de ambiente
- Copie o arquivo `docker-compose.override.yml.example` para `docker-compose.override.yml` e altere as configurações especificas da sua máquina.
- Execute o comando `make up` para rodar o projeto
- Adicione a url do seu projeto que esta na variavel `PROJECT_URL` no seu arquivo `/etc/hosts` para acessar o projeto
- Acesse o projeto no seu navegador

Digite `make help` para mais comandos
