import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medecin_gsb/api/service.dart';
import 'package:medecin_gsb/model/departement.dart';

import 'medecins_departements.dart';

class DepartementsScreen extends StatefulWidget {
  const DepartementsScreen({Key? key}) : super(key: key);

  @override
  _DepartementsScreenState createState() => _DepartementsScreenState();
}

class _DepartementsScreenState extends State<DepartementsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des départements'),
          ),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Departement>>(
                future: Service().getDepartementsData(),
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
                            title: Text(snapshot.data![i].num +" - "+snapshot.data![i].nom),
                            onTap: (){
                              //print(Service().getPaysDataByID(snapshot.data![i].id));
                              Navigator.pushNamed(context, MedecinsDepScreen.routeName, arguments: Service().getMedecinByDepartement(snapshot.data![i]));

                            },
                            /* subtitle: Text(snapshot.data[i].prenom),
      trailing: Text(snapshot.data[i].nom),*/
                          );
                        });
                  }}),
          ),
        ));
  }
}