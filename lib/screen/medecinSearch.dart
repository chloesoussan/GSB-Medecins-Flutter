import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medecin_gsb/model/medecin.dart';
import 'package:medecin_gsb/model/pays.dart';
import 'package:medecin_gsb/api/service.dart';

import 'profil.dart';

class MedecinSearchScreen extends StatefulWidget {
  const MedecinSearchScreen({Key? key}) : super(key: key);

  @override
  _MedecinSearchScreenState createState() => _MedecinSearchScreenState();
}

class _MedecinSearchScreenState extends State<MedecinSearchScreen> {

  TextEditingController editingController = TextEditingController();
  var items = List<Medecin>.generate(1, (index) => Medecin(id: 0, prenom: "---", nom: "---", adresse: "---", tel: "---"));
  void filterSearchResults(String query) async {
    if(query.isNotEmpty) {
      var result = await Service().getMedecinByNom(query);
      setState(() {
        items.clear();
        items = result;
      });
      return;
    } else {
      var result = await Service().getMedecinData();
      setState(() {
        items.clear();
       items = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recherche des médecins par nom :'),
         /* leading: BackButton(
              color: Colors.white
          ),*/ ),
        body: Container(
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context,MedecinProfil.routeName, arguments: Service().getMedecinByID(items[i].id));
                                  },
                                  title: Text(items[i].id.toString()+" "+items[i].nom),
                                  /* subtitle: Text(snapshot.data[i].prenom),
      trailing: Text(snapshot.data[i].nom),*/
                                );

                        }),
                ),
              ],
            ),
          ),
        ));
  }
}
