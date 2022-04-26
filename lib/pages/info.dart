import 'package:flutter/material.dart';

class Info extends StatefulWidget {

  final String value;
  final String value2;
  final String value3;
  final String value4;
  final String value5;
  final String value6;

  const Info(
      {
        Key? key,required this.value, required this.value2,
        required this.value3, required this.value4, required this.value5,
        required this.value6
      }) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alumnos"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo.jpg")
            )
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Column(
              children: [
                CircleAvatar(
                    maxRadius: 45,
                    child: Text(widget.value2.substring(0,1), style: const TextStyle(fontSize: 50),)
                ),
                const Padding(padding: EdgeInsets.all(15)),
                Text(widget.value,style: const TextStyle(fontSize: 20, color: Colors.black54),),
                Text(widget.value2,style: const TextStyle(fontSize: 25),),

              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text.rich(
                    TextSpan(
                        text: 'Carrera: ',
                        style: const TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: ' ${widget.value3} ', style: const TextStyle(fontStyle: FontStyle.italic)),
                        ]
                    )
                ),

                const Padding(padding: EdgeInsets.all(10)),

                Text.rich(
                    TextSpan(
                        text: 'Semestre: ',
                        style: const TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: ' ${widget.value4} ', style: const TextStyle(fontStyle: FontStyle.italic)),
                        ]
                    )
                ),

                const Padding(padding: EdgeInsets.all(10)),

                Text.rich(
                    TextSpan(
                        text: 'Teléfono: ',
                        style: const TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: ' ${widget.value5} ', style: const TextStyle(fontStyle: FontStyle.italic)),
                        ]
                    )
                ),

                const Padding(padding: EdgeInsets.all(10)),

                Text.rich(
                    TextSpan(
                        text: 'Correo: ',
                        style: const TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(text: ' ${widget.value6} ', style: const TextStyle(fontStyle: FontStyle.italic)),
                        ]
                    )
                ),

                const Padding(padding: EdgeInsets.all(10)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
