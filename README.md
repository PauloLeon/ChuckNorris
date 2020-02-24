# ChuckNorris

  projeto sample consumindo API Chuck Norris


## Processo de instalação:

Versão do Xcode : 11.*
iOS: 9.*

Para rodar a aplicação basta executar o comando (na pasta raiz do projeto): 

```python
pod install 
```

- Apos a instalação do pod, usar Desafio.xcworkspace para abrir o Xcode
- CMD + R para rodar aplicação
- CMD + U para rodar os testes Unitários e Funcionais


## Escolhas Técnicas:

- A aplicação utiliza __cocoapods__, para incluir __RXSwift, RXCocoa, SDWebImage__ (cache de imagens feito de forma simples), __Alamofire__ (com versão especificada para dar suporte da versão 9.* do iOS.)
- O App é universal, testado no iPad via simulador
- Arquitetura __MVVM__ facilitando testes unitários e funcionais alem de melhor organização
- __Coordinator Pattern__ para simplificar a navegação do App
- Layout incluindo __Acessibilidade__
- __Testes__ funcionais (utilização mock de retorno na API, para poder testar a camada de API) todas as chamadas são testadas dentro dos testes nas viewModels
- __ViewModels com Code Coverage 100%__ 


