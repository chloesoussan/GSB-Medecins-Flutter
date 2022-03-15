import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medecin_gsb/model/pays.dart';
import 'package:medecin_gsb/api/service.dart';

class PaysScreen extends StatefulWidget {
  const PaysScreen({Key? key}) : super(key: key);

  @override
  _PaysScreenState createState() => _PaysScreenState();
}

class _PaysScreenState extends State<PaysScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Liste des pays'),
            leading: BackButton(
            color: Colors.white
        ), ),
        body: Container(
          child: Card(
            child: FutureBuilder<List<Pays>>(
                future: Service().getPaysData(),
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
                            title: Text(snapshot.data![i].id.toString()+" "+snapshot.data![i].nom),
                            /* subtitle: Text(snapshot.data[i].prenom),
      trailing: Text(snapshot.data[i].nom),*/
                          );
                        });
                  }}),
          ),
        ));
  }
}
