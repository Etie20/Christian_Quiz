import 'package:flutter/material.dart';
import 'package:popup_project/add_page.dart';
import 'package:popup_project/my_question_page.dart';

import 'navBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("MyQuizz",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child:
        Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Padding(padding: EdgeInsets.all(5),
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/quiz.jpg"),fit: BoxFit.cover,height: 320,),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: (){Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, __, ___) => MyQuestionPage()));},
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
                    child: const Text("Commencez le quiz"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}