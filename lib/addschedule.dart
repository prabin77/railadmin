import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:railway_admin/fireservices.dart';

class AddSchedule extends StatefulWidget {
  @override
  _AddScheduleState createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   TextEditingController passwordController;
//   TextEditingController emailController;
  TextEditingController? firstacprice;
  TextEditingController? firstacseats;
  TextEditingController? fcprice;
  TextEditingController? fcseats;
  TextEditingController? secondacprice;
  TextEditingController? secondacseats;
  TextEditingController? thirdacprice;
  TextEditingController? thirdacseats;
  TextEditingController? trainno;
  TextEditingController? date;
  TextEditingController? time;
  TextEditingController? trainname;

  String? valueChoose;
  String? valueChoose1;
  List listItems = [
    'Inarwa',
    'Khajuri',
    'Mahinathpur',
    'Sahid Sarojnagar, Duhabi',
    'Baidehi, Itaharwa',
    'Deuri Parbaha',
    'Janakpur',
  ];

  @override
  // ignore: missing_return
  void initState() {
    super.initState();
    trainno = TextEditingController();
    trainname = TextEditingController();
    time = TextEditingController();
    date = TextEditingController();

    firstacseats = TextEditingController();
    firstacprice = TextEditingController();
    fcseats = TextEditingController();
    fcprice = TextEditingController();
    secondacseats = TextEditingController();
    secondacprice = TextEditingController();
    thirdacseats = TextEditingController();
    thirdacprice = TextEditingController();
  }

  @override
  void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
    trainno!.dispose();
    trainname!.dispose();
    time!.dispose();
    date!.dispose();
    time!.dispose();
    firstacprice!.dispose();
    firstacseats!.dispose();
    fcprice!.dispose();
    fcseats!.dispose();
    secondacprice!.dispose();
    secondacseats!.dispose();
    thirdacprice!.dispose();
    thirdacseats!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Schedule"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0)),
                  child: DropdownButtonFormField(
                    hint: Text('From'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    value: valueChoose,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose = newValue!.toString();
                      });
                    },
                    items: listItems.map((valueItem) {
                      return DropdownMenuItem(
                          value: valueItem, child: Text(valueItem));
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0)),
                  child: DropdownButtonFormField(
                    hint: Text('To'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    value: valueChoose1,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose1 = newValue!.toString();
                      });
                    },
                    items: listItems.map((valueItem) {
                      return DropdownMenuItem(
                          value: valueItem, child: Text(valueItem));
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                  // padding: EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 0),
                  child: TextFormField(
                    controller: time,
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
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) =>
                                    "${value!.hour}:${value.minute}");

                            print(t);
                            setState(() {
                              time!.text = t;
                            });
                            ;
                          },
                        )),
                  )),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 0.0),
                child: TextFormField(
                  controller: date,
                  // validator: (value) {
                  //   return null;
                  // },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date ',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          String s = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2025))
                              .then((value) => value.toString().split(" ")[0]);

                          print(s);
                          setState(() {
                            date!.text = s;
                          });
                        },
                      )),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 0.0),
                child: TextFormField(
                  controller: trainname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid citizenship number");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Train Name',
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 0.0),
                child: TextFormField(
                  controller: trainno,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid father's name");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Train No",
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10)),
                child: Text(
                  "1A AC First Class:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: firstacseats,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Total Seats',
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: firstacprice,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10)),
                child: Text(
                  "FC First Class:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: fcseats,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Total Seats',
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: fcprice,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10)),
                child: Text(
                  "2A AC 2-Tier:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: secondacseats,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Total Seats',
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: secondacprice,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10)),
                child: Text(
                  "3A AC 3-Tier:",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: thirdacseats,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Total Seats',
                  ),
                ),
              ),
              Padding(
                // padding: EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 20.0),
                child: TextFormField(
                  controller: thirdacprice,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("invalid address");
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      FiresbaseServices().addschedule(
                        train_name: trainname!.text,
                        train_no: trainno!.text,
                        to: valueChoose1,
                        from: valueChoose,
                        date: date!.text,
                        time: time!.text,
                        totalseat1ac: firstacseats!.text,
                        price1ac: firstacprice!.text,
                        totalseatfc: fcseats!.text,
                        pricefc: fcprice!.text,
                        totalseat2ac: secondacseats!.text,
                        price2ac: secondacprice!.text,
                        totalseat3ac: thirdacseats!.text,
                        price3ac: thirdacprice!.text,
                      );
                    }
                  },
                  child: Text(
                    'Add Schedule',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
