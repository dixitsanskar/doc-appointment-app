
import 'package:doctor_appointement/components/Firebasedata/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  void registerUser(String email, String password){
    AuthRepo.to.createUserWithEmailAndPassword(email, password);
  }
}