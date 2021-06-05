class Video {
  String? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;

  Video({
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.canal,
  });
  
//estamos utilizando o factory pois o retorno vai ser de um unico objeto, com isso conseguimos otimizar para que ele não retorne 100 items por exemplo
//ou seja o retorno de uma unica estancia de video que vai ser retornada toda vez(vai ocupar um unico espaço de memoria)
//ou seja uma economia de memoria
//ou seja ao invez de criar uma nova instancia, a primeira vez que ele instancia ele cria um 'cache' e na segunda, terceira etc... ele utiliza o cache que ja esta criado
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      //lembrese-para pegar o videoId, snippet, thumbnails etc...
      //eu la no site da api do youtube fiz uma requisição de test, copiei a resposta e joguei no site https://jsonformatter.curiousconcept.com/#
      //com isso ele apresenta todos os itens da api em titulos para podermos usa-los aqui !!
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      descricao: json['snippet']['description'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelTitle'],
    );
  }

  //OBS: olha só que interessante, eu pensei em usar o compute para criar uma thread separada ao carregamento dos videos
  //mais eu aprendi o factory que deixa em cache e decidi seguir o projeto usando dele
}


/*
Um construtor normal sempre irá retornar uma nova instância da classe atual (exceto quando o construtor lança uma exceção).

Um construtor de fábrica (factory) é bastante semelhante a um método estático com as seguintes diferenças:

1 - Só pode retornar uma instância da classe atual ou uma de suas subclasses, como você mesmo disse acima.

2 - Pode ser chamado com new mas, recentemente no Dart 2, newse tornou opcional.

3 -Não possui lista de inicializadores (no : super())

Assim, um construtor de fábrica (factory) pode ser usado para:

1 - Criar instâncias de subclasses (por exemplo, dependendo do parâmetro passado

retornar uma instância em cache em vez de uma nova)

2 - Preparar valores calculados para encaminhá-los como parâmetros para um construtor normal,
 para que os campos finais possam ser inicializados com eles.
  Isso geralmente é usado para solucionar as limitações do que pode ser feito em uma lista de inicializadores de um construtor normal 
  (como manipulação de erros).
*/








//   Video.fromJson(Map<String, dynamic> json) {
//       id = json['id']['videoId'];
//     titulo = json['snippet']['title'];
//     descricao = json['snippet']['description'];
//     imagem = json['snippet']['thumbnails']['high']['url'];
//     canal = json['snippet']['channelTitle'];
//   }

// }
