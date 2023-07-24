import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointement/components/button.dart';
import 'package:doctor_appointement/firebase_options.dart';
import 'package:doctor_appointement/util/config.dart';
import 'package:doctor_appointement/util/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signup_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _formkey = GlobalKey<FormState>();
  
  bool obsecurePass = true;
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: controller.nameController,
            keyboardType: TextInputType.name,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Name',
              labelText: 'Name',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.people_outlined),
              prefixIconColor: Config.primaryColor, 

            ),
          ),
         
          Config.spaceSmall,
          TextFormField(
            controller: controller.ageController,
            keyboardType: TextInputType.number,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Age',
              labelText: 'Age',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.cake_outlined),
              prefixIconColor: Config.primaryColor, 
              
            ),
          ),
          Config.spaceSmall
          ,
          TextFormField(
            controller: controller.phoneController,
            keyboardType: TextInputType.number,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Mobile Number',
              labelText: 'Mobile Number',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.call_outlined),
              prefixIconColor: Config.primaryColor, 
              
            ),
          ),
          Config.spaceSmall
          ,
         
          TextFormField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor),
          ),
            Config.spaceSmall
          ,
          TextFormField(
            //Creates a [FormField] that contains a [TextField].
            controller:  controller.passController,
            //Controls the text being edited.
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.lock_outlined),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      //Whenever you change the internal
                      //state of a [State] object, make the
                      // change in a function that you pass to [setState]
                      obsecurePass = !obsecurePass;
                    });
                  },
                  icon: obsecurePass
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black38,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                          color: Config.primaryColor,
                        ),
                )),
          ),
          Config.spaceSmall,
          Button(
              width: double.infinity,
              title: 'Sign Up',
              disable: false,
              onPressed: () async{
               
              if(_formkey.currentState!.validate()) 
              { //createUser(UserModel user)async {
                SignUpController.instance.registerUser(controller.emailController.text, controller.passController.text);
               
                };
                }

              ),
        ],
      ),
    );
  }
}
