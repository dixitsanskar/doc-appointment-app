import 'package:doctor_appointement/components/login_form.dart';
import 'package:doctor_appointement/components/register_form.dart';
import 'package:doctor_appointement/components/social_button.dart';
import 'package:doctor_appointement/util/config.dart';
import 'package:doctor_appointement/util/text.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppText.enText['welcome_text']!,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,
              Text(
                AppText.enText['signIn_text']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ) ,
              ),
              Config.spaceSmall,
              LoginForm()
              ,
              Config.spaceSmall,
              Center(child:
                TextButton(onPressed: (){},
                  child: Text(
                  AppText.enText['forgot-password']!,
                  style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ) ,
                ),
              ),
               ),
               const Spacer(),
               Center(
                child: 
                Text(
                  AppText.enText['social-login']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,

                  ),
                ),
               ),
               Config.spaceSmall,

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  SocialButton(social: 'Google'),
                  SocialButton(social: 'Facebook'),


                ],
               ),
               Config.spaceSmall,
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Text(
                    AppText.enText['signUp_text']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,

                  ),
                  ),
                  TextButton(onPressed: (){Navigator.of(context).pushNamed('registration_page');},
                  child: Text(
                    'Sign Up',
                  style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ) ,
                ),
              ),
                ],

               )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisteratonPage extends StatefulWidget {
  const RegisteratonPage({super.key});

  @override
  State<RegisteratonPage> createState() => _RegisteratonPageState();
}

class _RegisteratonPageState extends State<RegisteratonPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppText.enText['welcome_text']!,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Config.spaceSmall,
             const  Text(
                'Register your Account',
                style:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ) ,
              ),
              Config.spaceSmall, 
              RegisterForm(),

              Config.spaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}