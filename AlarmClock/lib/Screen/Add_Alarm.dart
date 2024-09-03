import 'dart:math';

import 'package:alarmclock/Provider/Provier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlaramState();
}

class _AddAlaramState extends State<AddAlarm> {
  late TextEditingController controller;

  String? dateTime;
  bool repeat = false;

  DateTime? notificationtime;

  String? name = "none";
  int? Milliseconds;

  @override
  void initState() {
    controller = TextEditingController();
    context.read<alarmprovider>().GetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
        automaticallyImplyLeading: true,
        title: const Text(
          'Add Alarm',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: CupertinoDatePicker(
                  showDayOfWeek: true,
                  minimumDate: DateTime.now(),
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (va) {
                    dateTime = DateFormat().add_jms().format(va);

                    Milliseconds = va.microsecondsSinceEpoch;

                    notificationtime = va;

                    print(dateTime);
                  },
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoTextField(
                    placeholder: "Add Label",
                    controller: controller,
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " Repeat daily",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 240,
                ),
                CupertinoSwitch(
                  value: repeat,
                  onChanged: (bool value) {
                    repeat = value;

                    if (repeat == false) {
                      name = "none";
                    } else {
                      name = "Everyday";
                    }

                    setState(() {});
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Random random = new Random();
                  int randomNumber = random.nextInt(100);

                  context.read<alarmprovider>().SetAlaram(controller.text,
                      dateTime!, true, name!, randomNumber, Milliseconds!);
                  context.read<alarmprovider>().SetData();

                  context
                      .read<alarmprovider>()
                      .SecduleNotification(notificationtime!, randomNumber);

                  Navigator.pop(context);
                },
                child: Text("Set Alaram")),
          ],
        ),
      ),
    );
  }
}
