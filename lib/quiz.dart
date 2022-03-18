import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText']
                  ?.toString() ?? // This return a string which represents an object
              '',
        ),
        ...(questions[questionIndex]['answer']
                as List<Map<String, dynamic>>) // ... is spread operator
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'],);
        }).toList()
      ],
    );
  }
}
