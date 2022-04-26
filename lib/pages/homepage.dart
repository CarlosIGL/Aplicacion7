import 'package:aplicacion7/pages/info.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final List<Estudiante> _personas = [
    Estudiante(
    "18760469", "Carlos Israel Godinez Luna", "Ing. Sistemas Computacionales",
     "8vo","6462694189","al18760469@ite.edu.mx"
    ),
    Estudiante(
        "16760180", "Virginia Rosario Ramirez Velasco", "Ing. Sistemas Computacionales",
        "7mo","6461208790","al16760180@ite.edu.mx"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Alumnos"),
        ),
        body: ListView.builder(
            itemCount: _personas.length,
            itemBuilder: (context, index) {


              return ListTile(

                title: Text(_personas[index].name),
                subtitle: Text(_personas[index].numerocontrol),
                leading:  CircleAvatar(
                  child: Text(_personas[index].name.substring(0,1)),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (BuildContext context) => Info(
                      value: _personas[index].numerocontrol.toString(),
                      value2: _personas[index].name.toString(),
                      value3: _personas[index].carrera.toString(),
                      value4: _personas[index].semestre.toString(),
                      value5: _personas[index].phone.toString(),
                      value6: _personas[index].correo.toString(),

                    ),
                  );
                  Navigator.of(context).push(route);
                },

              );
            })
    );
  }

}
class Estudiante {
  late String numerocontrol;
  late String name;
  late String carrera;
  late String semestre;
  late String phone;
  late String correo;

  Estudiante(this.numerocontrol, this.name, this.carrera, this.semestre, this.phone, this.correo);
}