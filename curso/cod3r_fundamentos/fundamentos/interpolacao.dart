main() {
  String nome = 'Joao';
  String status = 'Aprovado';
  double nota = 9.2;

  //sem interpolaçao
  String SemInterpolacao =
      nome + " está " + status + " porque tirou nota " + nota.toString() + "!";
  print(SemInterpolacao);

  //com interpolação
  //OBS note que o $nota ele ja coloca toString automaticamente
  //nao necessitando nos de colcoar .toString()
  String ComInterpolacao = "$nome está $status porque tirou nota $nota !";
  print(ComInterpolacao);
  //quando coloco $ ele interpreta como uma variavel
  //Quando eu apresentar $ eu coloco \$

  //para eu conseguir acessar metodos usando o $ eu faço assim
  String ComInterpolacao2 =
      "$nome está $status porque tirou nota ${nota.toString()} !";
  print(ComInterpolacao2);
}
