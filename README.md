# myMovieList_pucMinas

Projeto IOS desafio reportado como trabalho final da disciplina DESENVOLVIMENTO DE APLICAÇÕES PARA IOS - AVANÇADO da Pós Graduação Puc Minas.
Prof. Jackson Smith

Requisitos mínimos trabalho final:
3 Controllers (View Controllers, Navigation.. etc)
1 teste unitário
1 Padrão de Arquitetura utilizada 
1 requisição a alguma API

### Meu App - MyListMovie - Dev - FERNANDO MANOEL PEREIRA Matrícula: 140088
  O projeto consiste em realizar o consumo do serviço da Marvel [API](https://developer.marvel.com/) gerando uma lista contendo Imagem e Nome dos super heróis e ao selecionar uma imagem irá abrir uma nova janela mostrando a imagem e o detalhes(este caso tenha no json).
###


### Depêndencias
[CocoaPods](https://cocoapods.org/#install) - Para instalar as depêndencias do XCode.  
### Instalando as depêndencias com [CocoaPods](https://cocoapods.org/#install)

``` shell
$ pod install
```
### Gerando sua conta e key
[https://developer.marvel.com/](https://developer.marvel.com/) - Para gerar uma key para utilizar a API da Marvel.

### Biblioteca utilizada no projeto.
[Alamofire](https://cocoapods.org/pods/Alamofire) - Alamofire é uma biblioteca escrita totalmente na linguagem de programação Swift para realizar requisições HTTP para as plataformas iOS e macOS. Ele não utiliza recursos do seu "antecessor" escrito em Objective-C - conhecido como AFNetworking


### Configuração da API - Obs. Primeiramente gere sua conta e chave caso não possua.

 [MarvelMyListMovie/Api/Configs/ApiConfiguration.json](Marvel%20Catalog/Api/Configs/ApiConfiguration.json) modifique o valor dos parametros YOUR_PUBLIC_KEY e YOUR_PRIVATE_KEY.

``` shell
{
    "url": "http://gateway.marvel.com/v1/public/",
    "publicKey": "YOUR_PUBLIC_KEY",
    "privateKey": "YOUR_PRIVATE_KEY"
}
```
### Evidencia de teste:
https://github.com/ferpereira/myMovieList_pucMinas/blob/main/evidenciaProjetoPucMinas%20IOS%20-%20Avancado.mov?raw=true
