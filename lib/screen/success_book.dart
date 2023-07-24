import 'package:doctor_appointement/components/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 3,child: 
         Padding(padding: const EdgeInsets.all(115.0 )
        , child:  Lottie.asset('assets/images/success.json'),
         ),
          
          ),
          Container(
            width: double.infinity,
            alignment:  Alignment.center,
            child: const Text('Successfulluy Booked',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          const Spacer(),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Button(width: double.infinity, title: 'Back to Home Page', disable: false, onPressed: ()=> Navigator.of(context).pushNamed('main')),
          )
        ],
      )
      ),
    );
  }
}