import 'dart:convert';

class QuestionsModel {
  String category;
  String difficulty;
  String question;
  String correct_answer;
  List<String> incorrect_answer;

  QuestionsModel(this.category, this.difficulty, this.question,
      this.correct_answer, this.incorrect_answer);

  factory QuestionsModel.fromJson(String body) {
    var parsedJson = jsonDecode(body);
    return QuestionsModel(
      parsedJson["results"][0]["category"],
      parsedJson["results"][0]["difficulty"],
      parsedJson["results"][0]["question"],
      parsedJson["results"][0]["correct_answer"],
      List<String>.from(parsedJson["results"][0]["incorrect_answers"]),
    );
  }

  factory QuestionsModel.fromJsonList(dynamic json) {
    return QuestionsModel(
      json["category"],
      json["difficulty"],
      json["question"],
      json["correct_answer"],
      List<String>.from(json["incorrect_answers"]),
    );
  }
}



// https://opentdb.com/api.php?amount=10&category=21&type=multiple