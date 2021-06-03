//aqui estamos passando uma função que tem como parametro um double e outra função
//olha que interessante a funcaoParametro ela vai calcular automaticamente o bonus (calcularBonus)
void calcularSalario(double salario, Function funcaoParametro) {
  print("Seu salario é: $salario");

  //aqui chamamos a função que esta como parametro
  //como la no main colocamos a calcularBonus como parametro
  //essa funcaoParametro automaticamente vai se transformar na calcularBonus !
  funcaoParametro();
}

void calcularBonus() {
  print("Seu bonus é de: 20");
}

main() {
  //aqui no parametro eu vou passar a função que eu criei como parametro ali em cima
  //veja como nao precisamos colocar o (), calcularBonus()
  calcularSalario(1800.00, calcularBonus);

  //posso passar uma função anonima diretamente aqui sem ter que criar fora do main
  //e como estou passando uma funcao como parametro la em cima ele automaticamente pega essa função anonima
  //e transforma na funcao como parametro que esta la em cima !
  calcularSalario(2000.00, () {
    print("funcao anonima");
  });

  //a função anonima usamos quando é pouca linhas de codigo (ou para cada funcionario que o calculo seja diferente!)
  //quando tem uma extensa linha de codigo nos criamos a função la fora mesmo
}
