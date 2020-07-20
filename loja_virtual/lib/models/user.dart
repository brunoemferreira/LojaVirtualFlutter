import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  // Construtor
  User({this.email, this.password, this.name, this.id});

  // Atributos da classe
  String id;
  String name;
  String email;
  String password;

  String confirmPassword;

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');

  // Salva os dados do usuário
  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
    };
  }
}
