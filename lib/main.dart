import 'package:doctor_appointement/components/Firebasedata/authentication.dart';
import 'package:doctor_appointement/main_layout.dart';
import 'package:doctor_appointement/screen/auth_page.dart';
import 'package:doctor_appointement/screen/booking_page.dart';
import 'package:doctor_appointement/screen/doctor_detail.dart';
import 'package:doctor_appointement/screen/success_book.dart';
import 'package:doctor_appointement/util/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform
               ).then((value) => Get.put(AuthRepo()));
  prefs =  await SharedPreferences.getInstance();
  
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ],
  ).then((val){
  runApp(myApp());});
}

class myApp extends StatelessWidget {
  const myApp({super.key});
  static final navigatorKey = GlobalKey<NavigatorState>();
  //GlobalKey is an identifier for widgets and elements that
  //allows them to be referenced and manipulated from other
  //parts of your code, such as from a parent widget or from
  // within a callback function.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Doctor Appointment app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Defines the configuration
        //of the overall visual Theme for a MaterialApp or
        // a widget subtree within the app.
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Config.primaryColor,
            border: Config.outlinedBorder,
            errorBorder: Config.errorBorder,
            enabledBorder: Config.outlinedBorder,
            floatingLabelStyle: TextStyle(color: Config.primaryColor),
            prefixIconColor: Colors.black38),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      getPages: [
         GetPage(name: '/', page: () => const AuthPage()),
        GetPage(name: '/main', page: () => const MainLayout()),
        GetPage(name: '/doc_details', page: () => const DoctorDetails()),
        GetPage(name: '/booking_page', page: () => const BookingPage()),
        GetPage(name: '/success_booking', page: () => const AppointmentBooked()),
        GetPage(name: '/registration_page', page: () => const RegisteratonPage()),

        // GetPage(
        //   name: '/third',
        //   page: () => Third(),
        //   transition: Transition.zoom  

        // '/': (context) => const AuthPage(),
        // 'main': (context) => const MainLayout(),
        // 'doc_details': (context) => const DoctorDetails(),
        // 'booking_page' : (context) => const BookingPage(),
        // 'success_booking' : (context) => const AppointmentBooked(),
        // 'registration_page' :(context) => const RegisteratonPage(),
      ],
    );
  }
}
