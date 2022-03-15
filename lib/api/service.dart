import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medecin_gsb/model/departement.dart';
import 'package:medecin_gsb/model/medecin.dart';
import 'package:medecin_gsb/model/pays.dart';
/*const DUMYMEDECIN = '[{"id":1,"prenom":"Prosper","nom":"Di Conota","adresse":"25 rue Anatole France BRIANCON 05100","tel":"0485244174","specialiteComplementaire":null},{"id":2,"prenom":"Prosper","nom":"Di Conota","adresse":"25 rue Anatole France BRIANCON 05100","tel":"0485244174","specialiteComplementaire":null},{"id":3,"prenom":"Anne-Lucie","nom":"Ferdinand","adresse":"39 rue des gatinnes BILLIAT 01200","tel":"0433812572","specialiteComplementaire":null},{"id":4,"prenom":"Camille","nom":"Pastor","adresse":"58 rue du stade MESSINCOURT 08110","tel":"0365489929","specialiteComplementaire":null}]';*/
const URLSERVER = 'http://172.31.1.147:8080/api/v1/';
class Service {
   Future<List<Pays>> getPaysData() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'pays'));
    //await http.get(Uri.parse('https://www.google.com'));
    var jsonData = jsonDecode(response.body) as List;
    List<Pays> paysList = [];
    for (var u in jsonData) {
      Pays pays = Pays(u['id'], u['nom'], u['departements']);
      paysList.add(pays);
    }
    print(paysList.length);
    return paysList;
  }
    Future<List<Departement>> getDepartementsData() async {
    var response =
    await http.get(Uri.parse(URLSERVER + 'departements'));
    var jsonData = jsonDecode(response.body) as List;
    List<Departement> departementList = [];
    for (var u in jsonData) {
      Departement departement = Departement(u['id'], u['nom'], u['num'], u['pays'],u['medecins']);
      departementList.add(departement);
    }
    print(departementList.length);
    return departementList;
  }
   Future<List<Medecin>> getMedecinData() async {
   var response =
    await http.get(Uri.parse(URLSERVER + 'medecins'));
    var jsonData = jsonDecode(response.body) as List;
    /* var jsonData = jsonDecode(DUMYMEDECIN) as List;*/
    List<Medecin> medecinList = [];
    for (var u in jsonData) {
      Medecin medecins = Medecin(u['id'], u['prenom'], u['nom'],u['tel'],u['adresse']);
      medecinList.add(medecins);
    }
    print(medecinList.length);
    return medecinList;
  }
   Future<List<Medecin>> getMedecinByNom(String nom) async {
   var response =
    await http.get(Uri.parse(URLSERVER + 'medecins?nom'));
    var jsonData = jsonDecode(response.body) as List;
     /*var jsonData = jsonDecode(DUMYMEDECIN) as List;*/
    List<Medecin> medecinList = [];
    for (var u in jsonData) {
      Medecin medecins = Medecin(u['id'], u['prenom'], u['nom'],u['tel'],u['adresse']);
      if (medecins.nom.contains(nom)){
        medecinList.add(medecins);
      }
    }
    print(medecinList.length);
     return medecinList;
  }
}
