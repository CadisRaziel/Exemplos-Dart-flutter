main() {
  criarBotao(
    'Botão Sair',
    cor: 'Branco',
    largura: 5.0,
  );
}

//parametros nomeado = {}
void criarBotao(String texto, {String cor: 'blue', double largura: 0.0}) {
  print(texto);
  print(cor);
  print(largura);
}

void criarBotao1([String texto = 'oi', String data = '']) {}
