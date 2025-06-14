class DailyQuestion {
  final String question;
  final List<DailyAnswer> answers;

  DailyQuestion({required this.question, required this.answers});
}

class DailyAnswer {
  final String label;
  final String emoji; // Pode ser um unicode ou asset

  DailyAnswer({required this.label, required this.emoji});
}

class DailyQuestionnaire {
  final List<DailyQuestion> questions;
  int currentQuestion; // índice da questão atual
  final Map<int, int> userAnswers; // {índice da questão: índice da resposta}

  DailyQuestionnaire({
    required this.questions,
    this.currentQuestion = 0,
    Map<int, int>? userAnswers,
  }) : userAnswers = userAnswers ?? {};
}
