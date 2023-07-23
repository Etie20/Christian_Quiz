import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_project/navBar.dart';
import 'package:popup_project/question.dart';

class AddPage extends StatefulWidget {

  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{
  bool switchValue = true;
  Question quest1 = Question(enonce: "", photo: "", answer: false, num: 0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Add question'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter you question",
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(15),
                  )
              ),
              onChanged: (newString){
                setState(() {
                  quest1.enonce = newString;
                });
              },
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10,),
            Text(
              "Explain ",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              decoration: InputDecoration(
                    hintText: "Enter the answer",
                  border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(15),
                  )
              ),
              onChanged: (newString){
                setState(() {
                  quest1.enonce = newString;
                });
              },
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 10,),
            Text(
              "Answer ",
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("True/False",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                Switch(
                activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                    inactiveThumbColor: Colors.redAccent,
                    value: switchValue,
                    onChanged: (bool){
                  setState(() {
                    switchValue = bool;
                  });
                })
              ],
            )
          ],
        ),)

      ),
    );
  }

}
