import 'dart:convert';

import 'package:aplicacion7/pages/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  List estudiantes = [];

  Future<void> leerJson(BuildContext context) async{
    final String datosLeidos =
        await rootBundle.loadString('assets/estudiantes.json');
    final datosDecodificados = await json.decode(datosLeidos);
    setState(() {
      estudiantes = datosDecodificados["estudiantes"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Alumnos"),
        ),
        body: ListView.builder(
            itemCount: estudiantes.length,
            itemBuilder: (context, index) {


              return ListTile(

                title: Text(estudiantes[index]['name']),
                subtitle: Text(estudiantes[index]['numerocontrol']),
                leading:  CircleAvatar(
                  child: Text(estudiantes[index]['name'].substring(0,1)),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (BuildContext context) => Info(
                      value: estudiantes[index]['numerocontrol'].toString(),
                      value2: estudiantes[index]['name'].toString(),
                      value3: estudiantes[index]['carrera'].toString(),
                      value4: estudiantes[index]['semestre'].toString(),
                      value5: estudiantes[index]['phone'].toString(),
                      value6: estudiantes[index]['correo'].toString(),

                    ),
                  );
                  Navigator.of(context).push(route);
                },

              );
            })
    );
  }
}
