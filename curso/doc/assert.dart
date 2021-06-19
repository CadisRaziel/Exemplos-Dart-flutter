class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  //assert para capturar a primeira e segunda letra da palavra word
  FirstTwoLetters(String word)
      : assert(word.length >= 2),
        letterOne = word[0],
        letterTwo = word[1];
        
}

main (){
  FirstTwoLetters first = FirstTwoLetters('word');
  print('${first.letterOne}, ${first.letterTwo}');
}