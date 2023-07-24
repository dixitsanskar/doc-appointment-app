import 'package:doctor_appointement/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  int hello() {
    for (int i = 0; i <= 10000000; i++);
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 20,
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: FaIcon(
                isFav ? Icons.favorite_rounded : Icons.favorite_outline,
                color: isFav ? Colors.red : Colors.white,
              ))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Config.spaceMedium,
            AboutDoctor(),
            DetailBody(),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        icon: const FaIcon(
          Icons.edit_calendar,
          color: Colors.white,
        ),
        label: const Text('Book Appointment')
            .animate()
            .then()
            .shake(delay: const Duration(seconds: 2)),
        backgroundColor: Config.primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed('/booking_page');
        },
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(children: <Widget>[
        const CircleAvatar(
          radius: 65.0,
          backgroundImage: AssetImage('assets/images/profile1.jpg'),
        ),
        Config.spaceMedium,
        const Text(
          'Dr. Richard Tan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Config.spaceSmall,
        SizedBox(
            width: Config.widthSize * 0.75,
            child: Text('MBBS (internationallkmsdfmmdmflkmvkmcv mlkfdmvklm)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                softWrap: true,
                textAlign: TextAlign.center)),
        Config.spaceSmall,
        SizedBox(
            width: Config.widthSize * 0.75,
            child: Text('Sarawak General Hospital',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15,
                ),
                softWrap: true,
                textAlign: TextAlign.center)),
      ]),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Config.spaceSmall,
            DoctorInfo(),
            Config.spaceBig,
            const Text('About Doctor',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            Config.spaceSmall,
            Text(
              'fdsfjj fjiodsjf ij fi fjdiojfoi dsjiofdfj dsmfiojdeoifjd jomfoieirj eoireoj iojroiemrij eiej orijedfjdfdsuerr  rere e e re rerioerj ',
              style: TextStyle(fontWeight: FontWeight.w500, height: 1.5),
              softWrap: true,
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      children: const <Widget>[
        InfoCard(label: 'Patients', value: '109'),
        const SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Experience', value: '10 years'),
        const SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Rating', value: '4.5'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Config.primaryColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    ));
  }
}
