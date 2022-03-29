<hr>
<h1 align="center">docker-nextjs-application</h1>
<p align=center><i align="center">Aplicação modelo em Node/Next.js para implantação como container Docker</i></p>
<div align="center">

<a href="">[![Total alerts](https://img.shields.io/lgtm/alerts/g/DexDevLab/docker-nextjs-application.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/DexDevLab/docker-nextjs-application/alerts/)</a>
<a href="">[![Language grade: JavaScript](https://img.shields.io/lgtm/grade/javascript/g/DexDevLab/docker-nextjs-application.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/DexDevLab/docker-nextjs-application/context:javascript)</a>
<a href="">[![Code Size](https://img.shields.io/github/languages/code-size/DexDevLab/docker-nextjs-application)](https://github.com/DexDevLab/docker-nextjs-application)</a>
<a href="">[![Repo Size](https://img.shields.io/github/repo-size/DexDevLab/docker-nextjs-application)](https://github.com/DexDevLab/docker-nextjs-application)</a>

<a href="">[![Last Commit](https://img.shields.io/github/last-commit/DexDevLab/docker-nextjs-application)](https://github.com/DexDevLab/docker-nextjs-application/) </a>
<a href="">![Version](https://img.shields.io/badge/version-1.0.0-005bff) </a>
<a href="">[![license](https://img.shields.io/github/license/DexDevLab/docker-nextjs-application)](https://github.com/DexDevLab/docker-nextjs-application/LICENSE)</a>

</div>
<hr>

## Conteúdo

- [Objetivo](#objetivo)
- [Características](#características)
- [Stack](#stack)
- [Notas de versão](#notas-de-versão)
- [Como usar este repositório](#como-usar-este-repositório)
  - [Variáveis de Ambiente](#variáveis-de-ambiente)
- [Autores](#autores)
- [Contato](#contato)
- [Licença](#licença)

<hr>

## Objetivo

A fim de facilitar minhas implantações e testar meu ambiente de servidor caseiro o qual possui docker, resolvi criar esse repositório com uma API básica, cuja
única função é facilitar minha redistribuição e construção de imagens compatíveis com docker.

<hr>

## Características

- Fácil adaptação através dos arquivos auxiliares do Docker (.dockerignore, Dockerfile, docker-compose.yml)
- Permite a criação de imagem pelo Dockerfile e criação do stack pelo docker-compose

<hr>

## Stack

- **Linguagem Principal:** [Javascript](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
- **Framework Principal:** [Node.js](https://nodejs.org/en/docs/)
- **Framework estrutural:** [Next.js](https://nextjs.org/docs/getting-started)
- **Gerenciador de Bibliotecas:** [Yarn](https://yarnpkg.com/getting-started)
- **Bibliotecas:** Para uma lista completa de bibliotecas e dependências nos mais variados escopos, conferir o arquivo [package.json](https://github.com/DexDevLab/docker-nextjs-application/blob/master/package.json).
<hr>

## Notas de versão

Para ver as notas de versão, clique [aqui](https://github.com/DexDevLab/docker-nextjs-application/blob/master/CHANGELOG.md).

<hr>

## Como usar este repositório

### Utilizando como projeto

#### 1 - Realize um git clone deste repositório para seu repositório local:

```
$ git clone https://github.com/DexDevLab/docker-nextjs-application
```

#### 2 - Instale o yarn, inicialize-o, e rode o projeto.

```
$ npm install yarn -g
$ yarn
$ yarn dev
```

A aplicação estará executando normalmente em localhost:3000 como default.

**Lembre-se de executar `yarn build` ANTES de criar seu container com base no repositório local.**

<br>

### Criando o container a partir do repositório clonado

Para fazer o `docker compose` localmente, comente a linha 10 do [docker-compose.yml](https://github.com/DexDevLab/docker-nextjs-application/blob/master/docker-compose.yml):

`build: https://github.com/DexDevLab/docker-nextjs-application.git`

E descomente a linha 13:

`build: .`

Para apenas criar a imagem, utilize o `docker build` referenciando o arquivo local do [Dockerfile](https://github.com/DexDevLab/docker-nextjs-application/blob/master/Dockerfile):

```
docker build - < Dockerfile
```

<br>

### Utilizando como container Docker diretamente pelo repositório

Execute o comando:

```
docker run -p 5000:3000 -e github='https://github.com/DexDevLab/docker-nextjs-application.git' -it dexdevlab/docker-nextjs-application
```

A aplicação será instalada como um stack de container, com porta externa em 5000 e porta interna da aplicação como 3000, como default.

<br>

### Modificando portas do container

#### Alterando a porta interna da aplicação

##### 1 - Crie um arquivo `.env` dentro da raiz do repositório local que contenha a seguinte informação:

`PORT=1111`

E informe a porta desejada (1111 para exemplo).

##### 2 - Altere a linha 7 do `docker-compose.yml`:

```
ports:
            - "5000:1111"
```

E informe a mesma porta do passo anterior.

##### 3 - Altere a linha 7 do `Dockerfile`:

```
EXPOSE 1111
```

E informe a mesma porta do passo anterior.

<br>

#### Alterando a porta externa

Altere a linha 7 do `docker-compose.yml`:

```
ports:
            - "8080:3000"
```

E informe a porta desejada (8080 para exemplo).

<hr>

## Como a aplicação funciona

### Teste método **GET**

Acesse o navegador com o endereço localhost:3000/api/test (sendo 3000 a porta default), e receberá o seguinte resultado:

![image](https://user-images.githubusercontent.com/45993448/160700559-257b67d6-c5c3-481f-9474-ca884c9e2b2b.png)

### Teste método **POST**

Utilize sua ferramenta de teste de API favorita para enviar uma requisição POST para o endereço localhost:3000/api/test, do tipo objeto `data` em formato JSON:

```
{
  data: "teste01"
}
```

Se tudo correu bem, receberá uma resposta como essa:

![image](https://user-images.githubusercontent.com/45993448/160704419-db421e70-c006-4e40-adc9-c9366d915ad4.png)

<hr>

## Autores

<a href="https://github.com/DexDevLab/docker-nextjs-application/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=DexDevLab/docker-nextjs-application" />
</a>

<hr>

## Contato

Se você gostou desse projeto, me dê uma <a href="https://github.com/DexDevLab/docker-nextjs-application" data-icon="octicon-star" aria-label="Star DexDevLab/docker-nextjs-application on GitHub">estrela</a>.
<br>
Para contato, envie um email a: <a href="mailto:dex.houshi@hotmail.com">dex.houshi@hotmail.com</a>

<hr>

## Licença

Licenciado sob a [MIT License](https://github.com/DexDevLab/docker-nextjs-application/blob/master/LICENSE).
