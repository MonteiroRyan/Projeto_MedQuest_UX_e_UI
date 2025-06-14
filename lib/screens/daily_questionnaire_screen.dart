import 'package:flutter/material.dart';
import '../models/daily_questionnaire.dart';

class DailyQuestionnaireScreen extends StatefulWidget {
  const DailyQuestionnaireScreen({super.key});

  @override
  State<DailyQuestionnaireScreen> createState() =>
      _DailyQuestionnaireScreenState();
}

class _DailyQuestionnaireScreenState extends State<DailyQuestionnaireScreen> {
  final DailyQuestionnaire questionnaire = DailyQuestionnaire(
    questions: [
      DailyQuestion(
        question: "Como você está se sentindo hoje?",
        answers: [
          DailyAnswer(label: "Ótimo", emoji: "😄"),
          DailyAnswer(label: "Bom", emoji: "😊"),
          DailyAnswer(label: "Neutro", emoji: "😐"),
          DailyAnswer(label: "Ruim", emoji: "🙁"),
          DailyAnswer(label: "Muito ruim", emoji: "😫"),
        ],
      ),
      // Adicione mais perguntas se desejar...
    ],
  );

  void selectAnswer(int answerIndex) {
    setState(() {
      questionnaire.userAnswers[questionnaire.currentQuestion] = answerIndex;
      if (questionnaire.currentQuestion < questionnaire.questions.length - 1) {
        questionnaire.currentQuestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = questionnaire.questions[questionnaire.currentQuestion];
    final progress =
        (questionnaire.currentQuestion + 1) / questionnaire.questions.length;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          children: [
            Text(
              "Questionário diário",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'RobotoMono',
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              color: Colors.blue,
              backgroundColor: Colors.grey[200],
              minHeight: 7,
            ),
            SizedBox(height: 26),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    q.question,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Questão ${questionnaire.currentQuestion + 1} de ${questionnaire.questions.length}",
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(q.answers.length, (i) {
                      final a = q.answers[i];
                      bool selected =
                          questionnaire.userAnswers[questionnaire
                              .currentQuestion] ==
                          i;
                      return GestureDetector(
                        onTap: () => selectAnswer(i),
                        child: Column(
                          children: [
                            Text(a.emoji, style: TextStyle(fontSize: 36)),
                            SizedBox(height: 5),
                            Text(
                              a.label,
                              style: TextStyle(
                                fontWeight:
                                    selected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                fontSize: 14,
                                color: selected ? Colors.blue : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 28),
                  Divider(),
                  SizedBox(height: 6),
                  Center(
                    child: Text(
                      "Leva apenas 2 minutos",
                      style: TextStyle(color: Colors.grey[500], fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 48),
            IconButton(
              icon: Icon(Icons.arrow_back, size: 28),
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ],
        ),
      ),
    );
  }
}
