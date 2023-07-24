import 'dart:html';

import 'package:flutter/foundation.dart';

class UserModel{
  final String? name;
  final String? email;
  final String? age;
  final String? phone;
  const UserModel({this.name,this.email,this.age,this.phone});
  toJson()  {
    return{'name':name,
    'email':email,
    'age':age,
    'phone':phone};
  }
  factory UserModel.fromSnapshot(Map<String,dynamic> snapshot){
    
    return UserModel(
      name: snapshot['name'],
      email: snapshot['email'],
      age: snapshot['age'],
      phone: snapshot['phone'],
    );
  } 
}