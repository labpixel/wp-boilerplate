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

## Como alterar os hosts

Como fazer a alteração dos hosts no WSL e no Windows

**WSL**: 
- No terminal utilize o comando ``sudo nano /etc/hosts``
- Adicione os hosts da seguinte forma:
```
127.0.0.1 example.test
::1 example.test localhost
```
- Troque a opção ``example.test`` pelo endereço do seu site
- Salve o arquivo

**Windows**:
- Procure por bloco de notas/notepad no menu iniciar do Windows e acesse o mesmo como administrador
- Vá em ``arquivo/file``, clique em ``abrir/open`` 
- Navegue pelo seguinte caminho ``Windows/System32/drivers/etc/``
- No canto inferior direito troque a opção ``documentos de texto`` para ``todos os arquivos``
- Selecione o arquivo ``hosts``
- Adicione os hosts da seguinte forma:
```
127.0.0.1 example.test
::1 example.test localhost
```
- Troque a opção ``example.test`` pelo endereço do seu site
- Salve o documento
- Caso ele salve o arquivo ``hosts`` no formato .txt, acesse o diretorio onde o mesmo se encontra pelo explorador de arquivos do windows
- Clique em exibir na parte superior e marque a opção ``Extensão de nomes de arquivos``
- Altere o nome do arquivo ``hosts`` para ``hosts.bkp``
- Altere o arquivo ``hosts.txt`` para ``hosts``
- Nisso você terá o arquivo de backup do hosts original e o que foi editado no bloco de notas será o padrão do sistema

