import 'dart:convert';

import 'package:aplicacion7/pages/info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<Estudiantes> estudiantes = [];

  @override
  void initState() {
    loadEstudiantes();
    super.initState();
  }

  Future loadEstudiantes() async {
    final String jsonString = await getJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      estudiantes.add(Estudiantes.fromJson(i));
    }
  }

  Future<String> getJsonFromFirebase() async {
    String url = "https://primer-rest-api-7da0d-default-rtdb.firebaseio.com/estudiantes.json";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Alumnos"),
        ),
        body: Center(
          child: FutureBuilder(
              future: getJsonFromFirebase(),
              builder: (context, snapShot) {

                if(snapShot.hasData){
                  return ListView.builder(
                               itemCount: estudiantes.length,
                               itemBuilder: (context, index) {

                                return ListTile(

                                   title: Text(estudiantes[index].name),
                                   subtitle: Text(estudiantes[index].numerocontrol),
                                   leading:  CircleAvatar(
                                    child: Text(estudiantes[index].name.substring(0,1)),
                                   ),
                                   trailing: const Icon(Icons.arrow_forward_ios),

                                   onTap: () {
                                     var route = MaterialPageRoute(
                                      builder: (BuildContext context) => Info(
                                         value:  estudiantes[index].numerocontrol.toString(),
                                         value2: estudiantes[index].name.toString(),
                                        value3: estudiantes[index].carrera.toString(),
                                         value4: estudiantes[index].semestre.toString(),
                                         value5: estudiantes[index].phone.toString(),
                                         value6: estudiantes[index].correo.toString(),

                                       ),
                                     );
                                    Navigator.of(context).push(route);
                                  },

    );});
                } else{
                  return Card(
                    elevation: 5.0,
                    child: SizedBox(
                      height: 100,
                      width: 400,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Haciendo conexion....',
                                style: TextStyle(fontSize: 20.0)),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                semanticsLabel: 'Haciendo conexion....',
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.blueAccent),
                                backgroundColor: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
          ),

        )
      //**



    );
  }
}

class Estudiantes {
  Estudiantes(this.carrera, this.correo, this.name, this.numerocontrol, this.phone, this.semestre);

  final String carrera;
  final String correo;
  final String name;
  final String numerocontrol;
  final String phone;
  final String semestre;


  factory Estudiantes.fromJson(Map<String, dynamic> parsedJson) {
    return Estudiantes(
      parsedJson['carrera'].toString(),
      parsedJson['correo'].toString(),
      parsedJson['name'].toString(),
      parsedJson['numerocontrol'].toString(),
      parsedJson['phone'].toString(),
      parsedJson['semestre'].toString(),
    );
  }
}
