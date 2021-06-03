main() {
  //modos de somar +1 a variavel
  int a = 3;
  a = a + 1;
  a += 1;
  a++;

  //Operadores unarios
  int b = 1;
  b++;
  --b;

  //uma observação importante
  //graus de importancia
  //o --b sempre sera feito primeiro, pois o dart ve ele como mais importante
  //porque acontece isso, o --b ele é usado antes da comparação
  //e o b++ é usado depois da comparação

  //operador unario logico
  print(!true); //vai virar false
  print(!false); //vai virar true
}
