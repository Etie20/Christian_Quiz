import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popup_project/add_page.dart';
import 'package:popup_project/my_add_page.dart';
import 'package:popup_project/my_home_page.dart';
import 'package:popup_project/my_question_page.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      backgroundColor: Colors.deepOrange,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
              child: Column(
                children: const [
                  SizedBox(height: 80,),
                  Text("MyQuizz",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 45
                    ),),
                ],
              )
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined,color: Colors.white,),
            title: const Text("home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            onTap: () => Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => const MyHomePage(title: 'MyQuizz'))),
          ),
          const Divider(thickness: 1,color: Colors.white,),
          ListTile(
            leading: const Icon(Icons.add_box_outlined,color: Colors.white,),
            title: const Text("Ajouter une question",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            onTap: () => Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => const AddPage())),
          ),
          const Divider(thickness: 1,color: Colors.white,),
        ],
      ),
    );
  }

}
