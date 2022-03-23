import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medecin_gsb/model/departement.dart';
import 'package:medecin_gsb/model/medecin.dart';
import 'package:medecin_gsb/model/pays.dart';
import 'package:medecin_gsb/api/service.dart';


class MedecinsDepScreen extends StatefulWidget {
  const MedecinsDepScreen({Key? key}) : super(key: key);
  static const routeName= '/MedecinDepart';
  @override
  _MedecinsDepScreenState createState() => _MedecinsDepScreenState();
}

class _MedecinsDepScreenState extends State<MedecinsDepScreen> {

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Future<List<Medecin>>;
    return Scaffold(
        appBar: AppBar(
          title: Text('Liste des médecins'),
          /*  leading: BackButton(
            color: Colors.white
        ), */),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Medecin>>(
                future: args,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Loading...'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(snapshot.data![i].nom+" "+snapshot.data![i].prenom),
                            /* subtitle: Text(snapshot.data[i].prenom),
      trailing: Text(snapshot.data[i].nom),*/
                          );
                        });
                  }}),
          ),
        ));
  }
}
