//podemos ter classes e metodos genericos
//um exemplo de classe é a list

//obs: quando falamos de generic e colcoamos ? nao estamos dizendo que é nullo
//estamos dizendo que ele pode receber nullos
//non-nullable criar construtor
//nullable criar variaveis locais e fazer if's

//uma classe generica
class Box<T> {
  //esse T pode ser tanto nullable como non-nullable
  final T object;
  //como eu nao inicializai o final T object
  //eu coloquei ele no construtor, e o construtor faz esse trabalho de inicializar !!
  Box(this.object);
}

//esse exemplo é bem util quando nossa classe nao acessa um valor !
class Box2<T> {
  //declaramos o T como um tipo nullable quando criamos o object
  //ou seja mesmo se eu passar um int non-nullable para o Box2<T>
  //o objetct pode ser nullable
  T? object;
  Box2.empty();
  Box2.full(this.object);

  //caso eu queira ler esse valor
  //ele retorna o tipo T que é o valor de Box2
  //e estamos pegando nosso object e transformando em tipo T
  //com isso ele vai ver se passamos non-nullable ou nullable e vai transformar o T em um dos dois
  //Use o as para retornar o object
  //NAO USE O NULL ASSERTION AQUI '!'
  T unbox() => object as T;
}

main() {
  Box<String>('a string');
  Box<int?>(null);
}
