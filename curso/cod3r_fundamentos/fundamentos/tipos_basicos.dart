//Numeros (int e double)
//String
//Booleano (bool)]
//dynamic
//num

main() {
  int n1 = 3;
  double n2 = 5.67;

  //existe tambem o num
  // posso colocar um valor inteiro 7 ou um booleano 7.7
  // int e double sao extends de num
  //usado para criar varias de valores inteiros e booleanos
  num n3 = 7;

  //posso atribuir um valor negativo e colocar um .abs() o abs vai fazer com que ele fique positivo
  double teste = -5.67.abs();

  double teste1 = double.parse(
      "12.5689"); //o valor "12,5689" pode ser convertido para double com o parse
  //OBS: NUNCA COLOQUE VIRGULA NO DOUBLE !! USE APENAS PONTO

  //ficaria assim o parse
  print(n1 +
      n2 +
      teste1); //olhe como nao da erro (o 12,5689 é uma string) porém o parse converteu ele para double

  //quando fizermos uma operação com 2 valores diferentes ou seja int com double
  print(n1 + n2);
  //o resultado é armazenado na variavel que cabe mais dados ou seja no double

  //=========================================
  //String
  String s1 = "bom";
  String s2 = "dia";

  print(s1 + s2.toUpperCase() + "!!!!");

  //==============================
  //bool

  bool estaChovendo = true;
  bool muitofrio = false;

  if (estaChovendo == true) {
    print("MUITA CHUVAA");
  } else if (muitofrio == false) {
    print("FRIOO");
  }

  //=============================================
  //dynamic

  //nao tem um tipo pré definido, posso colocar string, int, bool,
  dynamic x = "Testo bem legal";
  print(x);

  x = 123;
  print(x);

  x = false;
  print(x);

  //ja com o var não da para fazer isso !!!
}
