import 'package:flutter/material.dart';
import 'package:railway_admin/changetime.dart';
import 'package:railway_admin/fireservices.dart';
import 'package:railway_admin/model/schedule.dart';

class Schedules extends StatefulWidget {
  Schedules({this.sc});
  Schedule? sc;
  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Schedules'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("Train Name: ${widget.sc!.train_name} ",
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("Train Number: ${widget.sc!.train_no} ",
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("Departure Date: ${widget.sc!.date} ",
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("Departure Time:${widget.sc!.time}  ",
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("From:${widget.sc!.from} ",
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("To:${widget.sc!.to} ",
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child:
                    Text("1A AC First Class: ", style: TextStyle(fontSize: 18)),
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 135,
                    color: Colors.white,
                    child: Text(
                        "Booked Seats:${widget.sc!.ac_first_class!.booked_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 129,
                    color: Colors.white,
                    child: Text(
                        "Empty Seats:${widget.sc!.ac_first_class!.empty_seats} , ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 128,
                    color: Colors.white,
                    child: Text(
                        "Total Seats:${widget.sc!.ac_first_class!.total_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("FC First Class: ", style: TextStyle(fontSize: 18)),
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 135,
                    color: Colors.white,
                    child: Text(
                        "Booked Seats:${widget.sc!.first_class!.booked_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 129,
                    color: Colors.white,
                    child: Text(
                        "Empty Seats:${widget.sc!.first_class!.empty_seats} , ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 128,
                    color: Colors.white,
                    child: Text(
                        "Total Seats:${widget.sc!.first_class!.total_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("2A AC 2_Tier: ", style: TextStyle(fontSize: 18)),
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 135,
                    color: Colors.white,
                    child: Text(
                        "Booked Seats:${widget.sc!.ac_2_tier!.booked_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 129,
                    color: Colors.white,
                    child: Text(
                        "Empty Seats:${widget.sc!.ac_2_tier!.empty_seats} , ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 128,
                    color: Colors.white,
                    child: Text(
                        "Total Seats:${widget.sc!.ac_2_tier!.total_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 400,
                color: Colors.white,
                child: Text("3A AC 3-Tier: ", style: TextStyle(fontSize: 18)),
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 135,
                    color: Colors.white,
                    child: Text(
                        "Booked Seats:${widget.sc!.ac_3_tier!.booked_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 129,
                    color: Colors.white,
                    child: Text(
                        "Empty Seats:${widget.sc!.ac_3_tier!.empty_seats} , ",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    height: 60,
                    width: 128,
                    color: Colors.white,
                    child: Text(
                        "Total Seats:${widget.sc!.ac_3_tier!.total_seats}, ",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 170,
                color: Colors.white,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.green;
                        return Colors.black;
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ChangeTime()));
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.map),
                      Text(
                        'Edit Time',
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
