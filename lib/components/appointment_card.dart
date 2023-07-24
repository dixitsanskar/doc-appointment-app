import 'package:doctor_appointement/util/config.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile1.jpg'),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Dr. Richard Tan',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold),

                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text('Dental',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  )
                ],
              )
                ],
              ),
              Config.spaceSmall,
              const ScheduleCard(),
              Config.spaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){},
               style:ElevatedButton.styleFrom(
                backgroundColor: Colors.red
               ) ,child: const Text('Cancel'
               ,style:TextStyle(color: Colors.white) ,
               ),
               ),
               ),
               const SizedBox(
                width: 20,
               ),
              Expanded(child: ElevatedButton(onPressed: (){},
               style:ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 48, 139, 52)
               ) ,child: const Text('Re-Schedule'
               ,style:TextStyle(color: Colors.white) ,
               ),
               ),
               )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 16, 69),
        borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
               Icon(Icons.calendar_today,
                color: Colors.white,
                size: 15,
                ),
                 SizedBox(
                  width: 5,
                ),
                Text(
                  'Monday, 11/20/2022',
                  style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  
                ),
                 SizedBox(width: 20,),
                Icon(Icons.access_alarm,
                color: Colors.white,
                size: 17,
                ),
                 SizedBox(width: 5,),
                Flexible(child: Text('2:00 PM', style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),))
              ],
            ),
            
    );
  }
}