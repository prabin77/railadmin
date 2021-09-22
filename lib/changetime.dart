import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChangeTime extends StatefulWidget {
   ChangeTime({Key? key,this.schedule_id,this.name}) : super(key: key);
  String? schedule_id;
  String? name;


  @override
  _ChangeTimeState createState() => _ChangeTimeState();
}

class _ChangeTimeState extends State<ChangeTime> {
  TextEditingController? timechn;
  Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    timechn = TextEditingController();
    print(widget.schedule_id! + widget.name!);
  }

  @override
  void dispose() {
    super.dispose();
    timechn!.dispose();
  }
  Future<void> sendPushMessage() async {
   
  var data=  {
      'to': "/topics/${widget.schedule_id}",
      
      "notification" : {
      "body" : "Train Delayed",
      "title" : "Your train ${widget.name} has been moved to ${timechn!.text}"
    }
    };

    try {
      await dio.post("https://fcm.googleapis.com/fcm/send",data:data,options:Options(
        headers: {
           'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':'key= AAAA9hU1v8s:APA91bFcyvuhddlZU14Nl3f3DjzJ6ncxQVhxG-eir_4q3UwlWOc8dqC7nrMy2JstAL6lc-uUZjuw9bKZZ477_Go4DuChXnXcRMnrq8CIDu3jIW3YQXt3fLDpAiAGWktK2YLdZ1sTg2z1'
        }
      )).then((e){
        print(e.data);
      });
      // await http.post(
      //   Uri.parse('https://fcm.googleapis.com/fcm/send'),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //     'Authorization':'key= AAAA9hU1v8s:APA91bFcyvuhddlZU14Nl3f3DjzJ6ncxQVhxG-eir_4q3UwlWOc8dqC7nrMy2JstAL6lc-uUZjuw9bKZZ477_Go4DuChXnXcRMnrq8CIDu3jIW3YQXt3fLDpAiAGWktK2YLdZ1sTg2z1 '
      //   },
      //   body: constructFCMPayload(_token),
      // );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Time'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 0),
              child: TextFormField(
                controller: timechn,
                validator: (value) {
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () async {
                        String t = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) => "${value!.hour}:${value.minute}");

                        print(t);
                        setState(() {
                          timechn!.text = t;
                        });
                        ;
                      },
                    )),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: sendPushMessage,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*0.8,
                    color:Colors.red,
                    child: Center(child: Text("Confirm")),
                
                  ),
                ),
              )
        ],
      ),
    );
  }
}
