import 'package:flutter/material.dart';
import 'package:sqllite/Data.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    TextEditingController id_controller = TextEditingController();
    TextEditingController name_controller = TextEditingController();
    TextEditingController std_controller = TextEditingController();
    TextEditingController nomber_controller = TextEditingController();
    TextEditingController dream_controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Update  LIST"),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 3,
                keyboardType: TextInputType.number,
                controller: id_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ID",
                  hintText: "Enter Your ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 1,
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
                maxLength: 2,
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
                maxLength: 10,
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
                maxLines: 1,
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
                db.updateData(id_controller.text,name_controller.text, std_controller.text,nomber_controller.text, dream_controller.text);
                Navigator.pop(context);
              },
              child: Icon(Icons.update),
            ),
          ],
        ),
      ),
    );
  }
}
