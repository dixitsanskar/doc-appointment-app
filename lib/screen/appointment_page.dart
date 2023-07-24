import 'package:doctor_appointement/util/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Richard Tan",
      "doctor_profile": "assets/images/profile1.jpg",
      "category": "Dental",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Max Lim",
      "doctor_profile": "assets/images/profile1.jpg",
      "category": "Cardioloagy",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Jane Wing",
      "doctor_profile": "assets/images/profile1.jpg",
      "category": "General",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Jenny Song",
      "doctor_profile": "assets/images/profile1.jpg",
      "category": "Dermatology",
      "status": FilterStatus.cancel
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Appointment Schedule',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (FilterStatus filterStatus in FilterStatus.values)
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (filterStatus == FilterStatus.upcoming) {
                                    status = FilterStatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                  }
                                  if (filterStatus == FilterStatus.complete) {
                                    status = FilterStatus.complete;
                                    _alignment = Alignment.center;
                                  }
                                  if (filterStatus == FilterStatus.cancel) {
                                    status = FilterStatus.cancel;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Center(
                                child: Text(filterStatus.name),
                              )))
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: _alignment,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      status.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ) 
            ],
          ),
          Config.spaceSmall,
          Expanded(
              child: ListView.builder(
            itemBuilder: ((context, index) {
              var _schedule = filteredSchedules[index];
              bool isLastElement = filteredSchedules.length + 1 == index;
              return  Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                    margin: !isLastElement ? const EdgeInsets.only(bottom: 20): EdgeInsets.zero ,
                    child: Padding(padding: 
                    const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(_schedule['doctor_profile']),
                            ),
                            Config.spaceSmall,
                            const SizedBox(width: 7,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_schedule['doctor_name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                                ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(_schedule['category'],
                                style: TextStyle( 
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                                ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                                  height: 15,
                                ),
                              const  ScheduleCard(),
                               const SizedBox(
                                  height: 15,
                                ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: OutlinedButton(onPressed: (){},
                             child: const Text('Cancel',
                             style: TextStyle(
                              color: Config.primaryColor
                             ),))),
                             const SizedBox(width: 20,),
                             Expanded(child: OutlinedButton(onPressed: (){},
                             style: OutlinedButton.styleFrom(backgroundColor: Config.primaryColor),
                             child: const Text('Reschedule',
                             style: TextStyle( 
                              color: Colors.white
                             ),))),
                             const SizedBox(width: 20,),

                          ],
                        )
                      ],
                    ),
                    ),
              );
            }),
            itemCount: filteredSchedules.length,
          ))
        ],
      ),
    ));
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Config.primaryColor,
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