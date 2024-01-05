import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:trivia_app/models/trivia_questions.dart';

class QuestionDetail extends StatelessWidget {
  final QuestionsModel questionModel;

  const QuestionDetail({Key? key, required this.questionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 247, 255),
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Logo at the top center
            Icon(
              Icons.question_answer,
              size: 100,
              color: Colors.blue,
            ),

            SizedBox(height: 16),

            // Big Title for the Category
            Text(
              questionModel.category,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            // Subtitle for the Question
            Text(
              _parseHtmlString(questionModel.question),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 16),

            // Disabled Button with the Answer
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 50, vertical: 12), // Adjust padding
              decoration: BoxDecoration(
                color: Colors.blue, // Background color
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _parseHtmlString(questionModel.correct_answer),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future callAPI() async {
  //   Response response =
  //       await http.get(Uri.parse("https://api.adviceslip.com/advice/$id"));
  //   if (response.statusCode == 200) {
  //     QuestionsModel newSlip = QuestionsModel.fromJson(response.body);
  //     print(response.body);
  //     return newSlip;
  //   } else {
  //     throw Exception("Failed to load data");
  //   }
  // }
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String? parsedString = document.body?.text;
    return parsedString ?? ''; // Return an empty string if parsedString is null
  }
}
