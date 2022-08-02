import 'package:flutter/material.dart';
import 'package:sqllite/Data.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

  List<Map<String, dynamic>> l1 = [];

  void getData() async {
    Datahelper db = Datahelper();
    List<Map<String,dynamic>> l2 = await db.readData();
    setState(() {
      l1= l2;
    });
  }

  @override
  Widget build(BuildContext context) {



    TextEditingController name_controller = TextEditingController();
    TextEditingController std_controller = TextEditingController();
    TextEditingController nomber_controller = TextEditingController();
    TextEditingController dream_controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("ADD LIST"),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  hintText: "Enter Your Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: std_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "STD",
                  hintText: "Enter Your STD",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: nomber_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Phone Nomber",
                  hintText: "Enter Your Nomber",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: dream_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Dream",
                  hintText: "Enter Your Dream",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Datahelper db = Datahelper();
                db.insertData(name_controller.text, std_controller.text,
                    nomber_controller.text, dream_controller.text);

                getData();
                Navigator.pop(context);

              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
