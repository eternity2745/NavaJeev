import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hack_a_addict/Screens/quizScore.dart';
import 'package:hack_a_addict/Utilities/stateManagement.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {


  List<Map<String, dynamic>> quizQuestions = [];
  List<Map<String, dynamic>> quizResults = [];

  Color colorb1 = Colors.black26;
  Color colorb2 = Colors.black26;
  Color colorb3 = Colors.black26;
  Color colorb4 = Colors.black26;


  getQuizQuestions() {
    quizQuestions = Provider.of<StateManagement>(context, listen: false).getQuizQuestions();
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    getQuizQuestions();
  }

  PageController controller = PageController();
  String correctAnswer = "";
  String question = "";
  String selectedAnswer = "";
  List<String> options = [];
  int selectedOption = -1;
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Quiz"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 3.w, right: 3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: 
                    Row(               
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                        width: 60.w,
                        child: LinearProgressIndicator(
                          value: (questionIndex+1)/10,
                          backgroundColor: Colors.red.shade900,
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      Text(
                        "${questionIndex+1}/10",
                        style: TextStyle(
                          fontSize: 0.3.dp,
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),
                        )
                    ],
                  ),    
                ),
              SizedBox(height: 0.4.h,),
              SizedBox(
                          width: double.infinity,
                          height: 60.h,
                          child: PageView.builder(
                            controller: controller,
                            itemCount: 10,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              correctAnswer = quizQuestions[questionIndex]['a'];
                              question = quizQuestions[questionIndex]['q'];
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                    height: 57.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.blue.shade400
                                    ),
                                    child: Column(
                                      children: [
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          height: 15.h,
                                          child: AutoSizeText(question,
                                                      // stepGranularity: 10,
                                                      style: TextStyle(
                                                        fontSize: 0.4.dp,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white
                                                      ),
                                                      ),
                                        ),
                                        SizedBox(height: 3.h,),
                                        // ignore: sized_box_for_whitespace
                                        Container(
                                          height: 30.h,
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                      onPressed: () {
                                                        colorb1 = Colors.green;
                                                        colorb2 = Colors.black26;
                                                        colorb3 = Colors.black26;
                                                        colorb4 = Colors.black26;
                                                        selectedAnswer = quizQuestions[questionIndex]['o1'];
                                                        setState(() {
                                                          
                                                        });
                                                      }, 
                                                      style: ButtonStyle(
                                                        fixedSize: WidgetStateProperty.all(Size(100.w, 1.7.h)),
                                                        backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(14),
                                                          side: BorderSide(color: colorb1, width: 3.0)
                                                        ))
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Text(quizQuestions[questionIndex]['o1'], style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 0.32.dp
                                                          ),
                                                          textAlign: TextAlign.justify,
                                                          ),
                                                        ),
                                                      )
                                                ),
                                                SizedBox(height: 1.h,),
                                                ElevatedButton(
                                                      onPressed: () {
                                                        colorb1 = Colors.black26;
                                                        colorb2 = Colors.green;
                                                        colorb3 = Colors.black26;
                                                        colorb4 = Colors.black26;
                                                        selectedAnswer = quizQuestions[questionIndex]['o2'];
                                                        setState(() {
                                                          
                                                        });
                                                      }, 
                                                      style: ButtonStyle(
                                                        fixedSize: WidgetStateProperty.all(Size(100.w, 1.7.h)),
                                                        backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(14),
                                                          side: BorderSide(color: colorb2, width: 3.0)
                                                        ))
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Text(quizQuestions[questionIndex]['o2']
                                                          ,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 0.32.dp
                                                          ),
                                                          textAlign: TextAlign.justify,
                                                          ),
                                                        ),
                                                      )
                                                ),
                                                SizedBox(height: 1.h,),
                                                ElevatedButton(
                                                      onPressed: () {
                                                        colorb1 = Colors.black26;
                                                        colorb2 = Colors.black26;
                                                        colorb3 = Colors.green;
                                                        colorb4 = Colors.black26;
                                                        selectedAnswer = quizQuestions[questionIndex]['o3'];
                                                        setState(() {
                                                          
                                                        });
                                                      }, 
                                                      style: ButtonStyle(
                                                        fixedSize: WidgetStateProperty.all(Size(100.w, 1.7.h)),
                                                        backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(14),
                                                          side: BorderSide(color: colorb3, width: 3.0)
                                                        ))
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Text(quizQuestions[questionIndex]['o3'], style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 0.32.dp
                                                          ),
                                                          textAlign: TextAlign.justify,
                                                          ),
                                                        ),
                                                      )
                                                ),
                                                SizedBox(height: 1.h),
                                                ElevatedButton(
                                                      onPressed: () {
                                                        colorb1 = Colors.black26;
                                                        colorb2 = Colors.black26;
                                                        colorb3 = Colors.black26;
                                                        colorb4 = Colors.green;
                                                        selectedAnswer = quizQuestions[questionIndex]['o4'];
                                                        setState(() {
                                                          
                                                        });
                                                      }, 
                                                      style: ButtonStyle(
                                                        fixedSize: WidgetStateProperty.all(Size(100.w, 1.7.h)),
                                                        backgroundColor: WidgetStateProperty.all(Colors.transparent),
                                                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(14),
                                                          side: BorderSide(color: colorb4, width: 3.0)
                                                        ))
                                                      ),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: Text(quizQuestions[questionIndex]['o4'], style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 0.32.dp
                                                          ),
                                                          textAlign: TextAlign.justify,
                                                          ),
                                                        ),
                                                      )
                                                ),
                                                
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            ),
                        ),
                  ElevatedButton(
                      onPressed: () {
                        if (questionIndex <= 8) {
                          controller.nextPage(
                              duration: Duration(milliseconds: 500), 
                              curve: Curves.fastLinearToSlowEaseIn
                            );
                          
                          if ([colorb1, colorb2, colorb3, colorb4].any((element) => element == Colors.green)) {
                            if (selectedAnswer == correctAnswer) {
                              Provider.of<StateManagement>(context, listen: false).updateCorrectAnswers();
                            }else{
                              Provider.of<StateManagement>(context, listen: false).updateWrongAnswers();
                            }
                          }else{
                            selectedAnswer = "None";
                          }
                          quizResults.add({
                            "q" : question,
                            "a" : correctAnswer,
                            "sa" : selectedAnswer,
                            "o1" : quizQuestions[questionIndex]['o1'],
                            "o2" : quizQuestions[questionIndex]['o2'],
                            "o3" : quizQuestions[questionIndex]['o3'],
                            "o4" : quizQuestions[questionIndex]['o4'],
                          });
                          colorb1 = Colors.black26;
                          colorb2 = Colors.black26;
                          colorb3 = Colors.black26;
                          colorb4 = Colors.black26;
                          questionIndex++;
                          setState(() {
                            
                          });

                        }else{
                          if ([colorb1, colorb2, colorb3, colorb4].any((element) => element == Colors.green)) {
                            if (selectedAnswer == correctAnswer) {
                              Provider.of<StateManagement>(context, listen: false).updateCorrectAnswers();
                            }else{
                              Provider.of<StateManagement>(context, listen: false).updateWrongAnswers();
                            }
                          }else{
                            selectedAnswer = "None";
                          }
                          quizResults.add({
                            "q" : question,
                            "a" : correctAnswer,
                            "sa" : selectedAnswer,
                            "o1" : quizQuestions[questionIndex]['o1'],
                            "o2" : quizQuestions[questionIndex]['o2'],
                            "o3" : quizQuestions[questionIndex]['o3'],
                            "o4" : quizQuestions[questionIndex]['o4'],
                          });
                          Provider.of<StateManagement>(context, listen: false).setQuizResults(quizResults);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => QuizScore()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(50.w, 6.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue.shade100,
                      ),
                      child: questionIndex <= 8 ? Text("Next") : Text("Submit")
                    )
            ],
          ),
        ),
      )
    );
  }
}