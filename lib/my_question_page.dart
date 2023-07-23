import 'package:flutter/material.dart';
import 'package:popup_project/my_home_page.dart';
import 'package:popup_project/question.dart';

class MyQuestionPage extends StatefulWidget{

  const MyQuestionPage({super.key});

  @override
  State<MyQuestionPage> createState() => _MyQuestionPageState();
}

class _MyQuestionPageState extends State<MyQuestionPage>{
  Question quest = Question(num: 0,enonce: "Paul était-il un apôtre de Jesus ?",photo: "assets/images/apostle.jpeg",answer: true);
  List<Question> question = [
    Question(num: 1,enonce: "Paul était-il un apôtre de Jesus ?",photo: "assets/images/apostle.jpeg",answer: true),
    Question(num: 2,enonce: "Jesus est-il Dieu ?",photo: "assets/images/2.jpeg",answer: true),
    Question(num: 3,enonce: "Tout le monde est enfant de Dieu ?",photo: "assets/images/2.jpeg",answer: false),
    Question(num: 4,enonce: "Faut-il être saint pour accepter Jesus ?",photo: "assets/images/2.jpeg",answer: false),
    Question(num: 5,enonce: "Est-ce que Tous les chrétiens sont fils de Dieu ?",photo: "assets/images/2.jpeg",answer: false),
    Question(num: 6,enonce: "Est-ce que Dieu nous parle ?",photo: "assets/images/2.jpeg",answer: true),
    Question(num: 7,enonce: "Tout le monde a-t'il droit à la vie éternel ?",photo: "assets/images/2.jpeg",answer: true),
    Question(num: 8,enonce: "Est-ce que Jesus agit encore aujourd'hui ?",photo: "assets/images/2.jpeg",answer: true),
    Question(num: 9,enonce: "Est-ce que Dieu veut avoir une relation personnelle avec nous ?",photo: "assets/images/2.jpeg",answer: true),
    Question(num: 10,enonce: "Est ce que Jesus t'aime ?",photo: "assets/images/2.jpeg",answer: true),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int i = quest.num;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Score : ${quest.score}"),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(10),
        child: Column(
            children: [
            const SizedBox(height: 15),
        Text("Question numéro : ${question[i].num} / ${question.length}",
          style: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 20,
          ),),
        const SizedBox(height: 100),
        Text(question[i].enonce,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          )
        ),
              const SizedBox(height: 50),
              Image(image: AssetImage(question[i].photo),fit: BoxFit.cover,height: 350,width: 350,),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: image)
                    ),
                  )
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(question[i].num == 10){
                          if(question[i].answer == false){
                            quest.score += 1;}
                          show(dialog: end());
                          }
                        else if(question[i].answer == false){
                        quest.score += 1;
                        show(dialog: win());
                        }else{show(dialog: lost());}
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                    child: const Text("Faux")
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if(question[i].num == 10){
                            if(question[i].answer == true){
                              quest.score += 1;}
                          show(dialog: end());
                          }else if(question[i].answer == true){
                              quest.score += 1;
                              show(dialog: win());
                            }else{
                              show(dialog: lost());
                            }
                          });
                        },
                      style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)
      ),
                      child: const Text("vrai")
                  ),
                  const Spacer(),
                ],
              )
        ],
      ),)

      ),
    );
  }
  SimpleDialog win(){
    return SimpleDialog(
      children: [
        const Text("  C'est gagné",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        const Image(image: AssetImage("assets/images/jesus.jpg")),
        ElevatedButton(
            onPressed: (){
              setState(() {
                Navigator.of(context).pop(false);
                quest.num +=1;
              });
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text("Passer à la question suivante",style: TextStyle(color: Colors.black,fontSize: 20),)
        )
      ],

    );
  }
  SimpleDialog lost(){
    return SimpleDialog(
      children: [
        const Text("  Perdu, Mais tu grandis en christ",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        const Image(image: AssetImage("assets/images/perdu.jpeg"), height: 300,),
        ElevatedButton(
            onPressed: (){
              setState(() {
                  Navigator.of(context).pop(false);
                  quest.num +=1;
              });
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text("Passer à la question suivante",style: TextStyle(color: Colors.black,fontSize: 20),)
        )
      ],

    );
  }
  SimpleDialog end(){
    return SimpleDialog(
      children: [
        Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("C'est fini",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              Text("Votre score est de : ${quest.score}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>const MyHomePage(title: 'Pop up')));
              }, child: const Text("OK"))
            ],
          ),
        )
      ],
    );
  }
  Future<void> show({required SimpleDialog dialog}) async {
   await showDialog(
     barrierDismissible: false,
       context: context,
       builder: (BuildContext ctx){
         return dialog;
   });
  }
}