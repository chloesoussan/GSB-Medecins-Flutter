import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medecin_gsb/model/medecin.dart';
import 'package:medecin_gsb/screen/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  Future<List<Medecin>> getMedecinData() async {
    var response =
        await http.get(Uri.parse('http://172.31.1.17:8080/api/v1/medecins'));
    var jsonData = jsonDecode(response.body) as List;
    List<Medecin> medecins = [];
    for (var u in jsonData) {
      Medecin medecin = Medecin(u['id'], u['prenom'], u['nom'], u['tel'], u['adresse']);
      medecins.add(medecin);
    }
    print(medecins.length);
    return medecins;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Liste des médecins')),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Medecin>>(
                future: getMedecinData(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data![i].prenom+" "+snapshot.data![i].nom),
                            /* subtitle: Text(snapshot.data[i].prenom),
      trailing: Text(snapshot.data[i].nom),*/
                          );
                        });
                  }}),
          ),
        ));
  }
}

