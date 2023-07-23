import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_project/navBar.dart';
import 'package:popup_project/question.dart';

class MyAddPage extends StatefulWidget {
  const MyAddPage({Key? key}) : super(key: key);

  @override
  State<MyAddPage> createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
  late TextEditingController controller;
  Question quest1 = Question(enonce: "", photo: "", answer: false, num: 0);

  @override
  void initState() {
    // TODO: implement initstate
    super.initState();
    //Tout ce qu'on fera lors de l'initialisation du Widget
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Add question'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Question : ', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20)),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                  hintText: "Entrez votre Nom",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              keyboardType: TextInputType.text,
              onChanged: (newString) {
                setState(() {
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
