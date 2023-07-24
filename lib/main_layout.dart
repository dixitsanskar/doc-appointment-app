import 'package:doctor_appointement/screen/appointment_page.dart';
import 'package:doctor_appointement/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  final PageController _page = PageController();
  //A controller for [PageView].
  //A page controller lets you manipulate which page is 
  //visible in a [PageView]. In addition to being able to
  // control the pixel offset of the content inside the [PageView]
  //, a [PageController] also lets you control the offset in terms 
  //of pages, which are increments of the viewport size.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //Creates a scrollable list
        //that works page by page from an
        // explicit [List] of widgets.
        controller: _page,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        children: const <Widget>[HomePage(), AppointmentPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color.fromARGB(255, 199, 199, 199),
        currentIndex: currentPage,
        onTap: (page) {
          setState(() {
            currentPage = page;
            _page.animateToPage(page,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
              label: 'Appointments')
        ],
      ),
    );
  }
}
