import 'package:affirmation_flutter_app/pages/main_scaffold.dart';
import 'package:affirmation_flutter_app/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Affirmations4u'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Flexible(
                flex: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/340434.png'),
                    fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                  child: FutureBuilder(
                      future: getAffirmationQuote(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Text(
                              myQuote,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Nanum',
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        } else {
                          return const SpinKitPumpingHeart(
                            color: Colors.white,
                            size: 100.0,
                          );
                        }
                      }
                  ),
                  ),

                )
            ),

            Flexible(
              flex: 3,
              child: Container(
                color: Colors.deepPurple[100],
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DatePickerTxt(),
                        ScheduleBtn(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerTxt extends StatefulWidget {
  const DatePickerTxt({super.key});

  @override
  State<DatePickerTxt> createState() => _DatePickerTxtState();
}

class _DatePickerTxtState extends State<DatePickerTxt> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            onChanged: (date) => scheduleTime = date,
            onConfirm: (date) {}
        );
      },
      child: const Text(
        "Select Date Time",
        style: TextStyle(
          fontSize: 20,
        ),

      ),
    );
  }
}

class ScheduleBtn extends StatelessWidget {
  const ScheduleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Schedule Notification',
        style: GoogleFonts.dmSans(
            fontSize: 18
        ),
      ),
      onPressed: () {
        debugPrint('Notification Scheduled for $scheduleTime');
        NotificationService().scheduleNotification(
            title: 'Scheduled Notification',
            body: '$scheduleTime',
            scheduleNotificationDateTime: scheduleTime
        );
      },
    );
  }
}

