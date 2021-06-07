class Item {
  final String name;
  final String categoria;
  final double preco;
  final DateTime data;

  Item({
    required this.name,
    required this.categoria,
    required this.preco,
    required this.data,
  });

  //aqui abaixo vamos converter um map em um Item

  //repare que vamos usar o factory aqui tambem igual no projeto do youtube
  factory Item.fromMap(Map<String, dynamic> map){
    //precisamos colocar o properties recebendo um map 
    final properties = map['properties'] as Map<String, dynamic>;

    //precisamos transformar a data em string
    final dateStr = properties['Data']?['date']?['start'];

    return Item(
      //colocamos ?? no final pois se um campo nao existir ele nao vai retornar nullo ele vai retornar um ?
      name: properties['Name']?['title']?[0]?['plain_text'] ?? '?',
      categoria: properties['Categoria']?['select']?['name'] ?? 'Aleatório',
      preco: (properties['Preco']?['number'] ?? 0).toDouble(),
      data: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),

    );
  }
}
