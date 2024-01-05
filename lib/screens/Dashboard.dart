import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:trivia_app/models/trivia_questions.dart';
import 'package:trivia_app/screens/QuestionDetail.dart';
import 'package:trivia_app/screens/Settings.dart';

// import 'package:flutter_html/flutter_html.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int num = 1;
  int trivia_num = 1;
  List<QuestionsModel> questions = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getQuestionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 247, 255),
      appBar: AppBar(
        title: Text("BrainBits Trivia"),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Settings.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Icon(
                  Icons.settings,
                  size: 30,
                ),
              ))
        ],
      ),
      body: isLoading // Check loading state
          ? Center(
              child:
                  CircularProgressIndicator(), // Show CircularProgressIndicator while loading
            )
          : Center(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionDetail(
                                  questionModel: questions[index])));
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Videogame Trivia Number: ${trivia_num++}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            _parseHtmlString(
                              questions[index].question,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: questions.length,
              ),
            ),
    );
  }

  // callAPI() async {
  //   Response response = await http.get(Uri.parse(
  //       "https://opentdb.com/api.php?amount=10&category=21&type=multiple"));
  //   Questions newQuestions = Questions.fromJson(response.body);
  //   print(response.body);
  //   setState(() {
  //     num += 1;
  //     questions.add(newQuestions);
  //   });
  // }

  Future<void> getQuestionList() async {
    try {
      Response response = await http.get(Uri.parse(
          "https://opentdb.com/api.php?amount=5&category=15&difficulty=easy&type=multiple"));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonResults = jsonResponse['results'];

      List<QuestionsModel> parsedQuestions =
          jsonResults.map((e) => QuestionsModel.fromJsonList(e)).toList();

      setState(() {
        questions = parsedQuestions;
        isLoading = false; // Set loading state to false after data is fetched
      });
    } catch (error) {
      print("Error fetching data: $error");
      // Handle error or show a message to the user
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String? parsedString = document.body?.text;
    return parsedString ?? ''; // Return an empty string if parsedString is null
  }
}
