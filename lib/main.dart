import 'package:flutter/material.dart';
import 'package:wecareapplication_parthkhushboo/login_page.dart';
import 'package:wecareapplication_parthkhushboo/add_patient_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wecareapplication_parthkhushboo/update_patient_screen.dart';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch:  Colors.blue
     
    ),
    title: "We Care",
    home: LoginPage(),
    debugShowCheckedModeBanner: false,

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients List'),
        
      ),
      body: MyDataListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addPatientScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class MyDataListView extends StatefulWidget {
  @override
  _MyDataListViewState createState() => _MyDataListViewState();
}

class _MyDataListViewState extends State<MyDataListView> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.0.146:8000/patients'));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        print("response" + response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => updatePatientScreen(data: data[index]['patient_name'])),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data[index]['patient_name'],
                      style: const TextStyle(fontSize: 18.0),
                    ),

                    const SizedBox(height: 8.0),
                    Text(
                      data[index]['address'],
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
