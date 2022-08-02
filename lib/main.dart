import 'package:flutter/material.dart';
import 'package:sqllite/Add.dart';
import 'package:sqllite/Data.dart';
import 'package:sqllite/Delite.dart';
import 'package:sqllite/Update.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        'Add': (context) => Add(),
        'Delite': (context) => Delite(),
        'Update': (context) => Update(),
      },
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> l1 = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Datahelper db = Datahelper();
    List<Map<String,dynamic>> l2 = await db.readData();
    setState(() {
      l1= l2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height ,
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 80,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        getData();
                        Navigator.pushNamed(context, 'Add');
                      },
                      child: Container(
                        height: 45,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(Icons.add, size: 50, color: Colors.white,),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'Delite');
                      },
                      child: Container(
                        height: 45,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(
                          Icons.delete, size: 50, color: Colors.white,),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'Update');
                      },
                      child: Container(
                        height: 45,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(
                          Icons.update, size: 50, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(


                  child: RefreshIndicator(

                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 1),
                          (){
                        setState(() {
                          getData();
                        });
                          }
                      );
                    },
                    child: ListView.builder(

                        itemCount: l1.length, itemBuilder: (context, index) {
                      return ListTile(

                         leading: Text("${l1[index]['id']}"),
                         title : Text("${l1[index]['name']}"),
                         subtitle : Text("${l1[index]['std']}"),
                        trailing: Text("${l1[index]['mobail']}"),
                      );
                      
                    }),
                  ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
