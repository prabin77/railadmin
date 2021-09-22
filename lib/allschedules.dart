import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:railway_admin/addschedule.dart';
import 'package:railway_admin/fireservices.dart';
import 'package:railway_admin/model/schedule.dart';
import 'package:railway_admin/train_schedule.dart';

class AllSchedules extends StatefulWidget {
  @override
  _AllSchedulesState createState() => _AllSchedulesState();
}

class _AllSchedulesState extends State<AllSchedules> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage message) {
    //   print("objectkjhgfghj");
    //   if (message != null) {
    //     // Navigator.pushNamed(context, '/message',
    //     //     arguments: MessageArguments(message, true));
    //   }
    // });

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification notification = message.notification;
    //   AndroidNotification android = message.notification?.android;
    //   if (notification != null && android != null && !kIsWeb) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             channel.description,
    //             // TODO add a proper drawable resource to android, for now using
    //             //      one that already exists in example app.
    //             icon: 'logo.png',
    //           ),
    //         ));
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   // Navigator.pushNamed(context, '/message',
    //   //     arguments: MessageArguments(message, true));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Schedules'),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddSchedule()));
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: FiresbaseServices().getSchedule(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data);
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    List<Schedule> s = snapshot.data;
                    return Container(
                      height: 900,
                      child: ListView.builder(
                        itemCount: s.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            leading: Icon(Icons.schedule),
                            title: Text(
                                '${s[index].train_name} , ${s[index].from} --> ${s[index].to}'),
                            subtitle: Text(
                                '${s[index].time} ,  ${s[index].date} ,  ${s[index].train_no} '),
                            onTap: () {
                              print(s[index].document_id);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Schedules(
                                        sc: s[index],
                                      )));
                            },
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text("loading");
                  }
                },
              ),
            ],
          ),
        ));
  }
}
