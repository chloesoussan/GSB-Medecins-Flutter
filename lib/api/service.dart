import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medecin_gsb/model/departement.dart';
import 'package:medecin_gsb/model/medecin.dart';
import 'package:medecin_gsb/model/pays.dart';
/*const DUMYMEDECIN = '[{"id":1,"prenom":"Prosper","nom":"Di Conota","adresse":"25 rue Anatole France BRIANCON 05100","tel":"0485244174","specialiteComplementaire":null},{"id":2,"prenom":"Prosper","nom":"Di Conota","adresse":"25 rue Anatole France BRIANCON 05100","tel":"0485244174","specialiteComplementaire":null},{"id":3,"prenom":"Anne-Lucie","nom":"Ferdinand","adresse":"39 rue des gatinnes BILLIAT 01200","tel":"0433812572","specialiteComplementaire":null},{"id":4,"prenom":"Camille","nom":"Pastor","adresse":"58 rue du stade MESSINCOURT 08110","tel":"0365489929","specialiteComplementaire":null}]';*/
const URLSERVER = 'http://172.31.1.67:8080/api/v1/';

class Service {
   Future<List<Pays>> getPaysData() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'pays'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Pays> paysList = [];
    for (var u in jsonData) {
      paysList.add(Pays.fromJson(u));
    }
    print(paysList.length);
    return paysList;
  }
   Future<Pays> getPaysDataByID(int id) async {
     var response =
     await http.get(Uri.parse(URLSERVER + 'pays/'+id.toString()));
     var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
     return Pays.fromJson(jsonData);
   }

    Future<List<Departement>> getDepartementsData() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'departements'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    List<Departement> departementList = [];
    for (var u in jsonData) {
      departementList.add(Departement.fromJson(u));
    }
    print(departementList.length);
    return departementList;
  }

   Future<List<Departement>> getDepartementsPaysData(Pays pays) async {
     var response =
     await http.get(Uri.parse(URLSERVER + 'pays/'+pays.id.toString()));
     var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
     return Pays.fromJson(jsonData).departements!;
   }

   Future<List<Medecin>> getMedecinByDepartement(Departement departement) async{
     var response =
     await http.get(Uri.parse(URLSERVER + 'departements/'+departement.id.toString()));
     var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
     return Departement.fromJson(jsonData).medecins!;
   }
   Future<List<Medecin>> getMedecinData() async {
   var response =
    await http.get(Uri.parse(URLSERVER + 'medecins'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    /* var jsonData = jsonDecode(DUMYMEDECIN) as List;*/
    List<Medecin> medecinList = [];
    for (var u in jsonData) {
      medecinList.add(Medecin.fromJson(u));
    }
    print(medecinList.length);
    return medecinList;
  }
   Future<List<Medecin>> getMedecinByNom(String nom) async {
   var response =
    await http.get(Uri.parse(URLSERVER + 'medecins?nom'));
    var jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as List;
     /*var jsonData = jsonDecode(DUMYMEDECIN) as List;*/
    List<Medecin> medecinList = [];
    for (var u in jsonData) {
      Medecin medecins = Medecin.fromJson(u);
      //print(medecins.departement!.nom);
      if (medecins.nom.contains(nom)){
        medecinList.add(medecins);
      }
    }
    print(medecinList.length);
     return medecinList;
  }

   Future<Medecin> getMedecinByID(int id) async {
     var response =
     await http.get(Uri.parse(URLSERVER + 'medecins/'+id.toString()));
     var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
     return Medecin.fromJson(jsonData);
   }
}
