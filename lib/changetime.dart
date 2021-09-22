import 'package:flutter/material.dart';

class ChangeTime extends StatefulWidget {
  const ChangeTime({Key? key}) : super(key: key);

  @override
  _ChangeTimeState createState() => _ChangeTimeState();
}

class _ChangeTimeState extends State<ChangeTime> {
  TextEditingController? timechn;

  @override
  void initState() {
    super.initState();
    timechn = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    timechn!.dispose();
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
        ],
      ),
    );
  }
}
