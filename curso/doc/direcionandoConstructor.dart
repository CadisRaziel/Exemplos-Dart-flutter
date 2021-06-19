class Color {
  int red;
  int green;
  int blue;
  
  Color(this.red, this.green, this.blue);

  //construtor nomeado passando valores padroes ao contrutor acima !
  Color.black() : this(0, 0, 0);
}
