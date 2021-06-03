import 'package:flutter/material.dart';
import 'package:nlw/challenge/widgets/awnser/awnser_widget.dart';
import 'package:nlw/core/app_text_styles.dart';
import 'package:nlw/shared/Models/awnser_model.dart';
import 'package:nlw/shared/Models/question_model.dart';

//cards de titulo das perguntas
class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnser(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(
                    value)); //para que quando o usuario selecionar a resposta, ele possa ver ela por 3 segundos e depois muda de tela no onChange
              },
            ),
        ],
      ),
    );
  }
}
