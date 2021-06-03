//remoção do construtor list()

//antes podiamos fazer assim List([int? lenght]), com isso nao inicializava nenhum elemento e podiamos por valores nulos

//agora a lista nao pode ter valores nulos
//List<int> lista = [1,2,3];
//list.field(5, 'vitor'); ele vai colocar 5 vitor dentro da lista
//list.generate(); //gerar a lista de acordo com alguma logica
//list.empty(); cria uma lista vazia (é novo constructor para substituir o construtor com nulos)

//alteração do .lenght em lista non-nullable
//list.Length - podemos usar o getter que obtem o numero de elementos , e o setter definir um comprimento para a lista
//o setter imagine o seguinte, tenho uma lsita com 7 itens e coloco apenas 3, os outors 4 ele joga no lixo
//o setter imagine o seguinte, tenho uma lista com 5 itens e coloco 10, os outros 5 ele coloca como nullo e dara um erro entao tome cuidado !
//a list.Length tem um getter e um setter
