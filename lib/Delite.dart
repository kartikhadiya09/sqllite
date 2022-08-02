import 'package:flutter/material.dart';
import 'package:sqllite/Data.dart';

 class Delite extends StatefulWidget {
   const Delite({Key? key}) : super(key: key);

   @override
   State<Delite> createState() => _DeliteState();
 }

 class _DeliteState extends State<Delite> {
   @override
   Widget build(BuildContext context) {
     TextEditingController id_controller = TextEditingController();

     return SafeArea(
       child: Scaffold(
         appBar: AppBar(title: Text("DELITE LIST"),),
         body: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                 keyboardType: TextInputType.number,
                 controller: id_controller,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "ID",
                   hintText: "Enter Your ID",
                 ),
               ),
             ),

             ElevatedButton(
               onPressed: () {
                 Datahelper db = Datahelper();
                 db.delitData(id_controller.text);
                 Navigator.pop(context);
               },
               child: Icon(Icons.delete),
             ),
           ],
         ),
       ),
     );
   }
 }
