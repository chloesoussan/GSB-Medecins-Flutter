import 'package:medecin_gsb/model/pays.dart';

import 'medecin.dart';

class Departement{
  int id;
  String nom;
  String num;
  Pays pays;
  List<Medecin> medecins;

  Departement(this.id,this.nom, this.num,this.pays,this.medecins);
}