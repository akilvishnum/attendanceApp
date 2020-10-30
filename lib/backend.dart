import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpClass extends StatefulWidget {
  @override
  _HttpClassState createState() => _HttpClassState();
}

class _HttpClassState extends State<HttpClass> {
  String greetings = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(greetings,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Center(
              child: Container(
                width: 150,
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async {
                    final response = await http
                        .get('http://192.168.43.11:5000/index'); //192.168.43.11
                    final decoded =
                        json.decode(response.body) as Map<String, dynamic>;

                    setState(() {
                      greetings = decoded['greetings'];
                    });
                  },
                  child: Text(
                    "Pressed",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class HttpClass extends StatelessWidget {
//   String greetings = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Text(greetings,
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             Center(
//               child: Container(
//                 width: 150,
//                 height: 60,
//                 child: FlatButton(
//                   color: Colors.blue,
//                   onPressed: () async {
//                     final response = await http.get('http://127.0.0.1:5000/');
//                     final decoded =
//                         json.decode(response.body) as Map<String, dynamic>;

//                     setState() {
//                       greetings = decoded['greetings'];
//                     }
//                   },
//                   child: Text(
//                     "Press",
//                     style: TextStyle(fontSize: 24),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
