import 'package:doctor_appointement/components/button.dart';
import 'package:doctor_appointement/firebase_options.dart';
import 'package:doctor_appointement/util/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor),
          ),
          Config.spaceSmall,
          TextFormField(
            //Creates a [FormField] that contains a [TextField].
            controller: _passController,
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
              title: 'Sign In',
              disable: false,
              onPressed: ()async  {
                await Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform
                );
              await  FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passController.text)
                .then((value) => {Navigator.of(context).pushNamed('main')})
                .catchError((error, stackTrace){SnackBar(content: Text('Wrong Credential, Try Again'));});

                
              }),
        ],
      ),
    );
  }
}
