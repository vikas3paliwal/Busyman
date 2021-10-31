import 'package:busyman/screens/tasks/taskfilters.dart';
import 'package:busyman/services/sizeconfig.dart';
import 'package:flutter/material.dart';

class AddReminder extends StatefulWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  _AddReminderState createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  late App _app;
  @override
  Widget build(BuildContext context) {
    _app = App(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Set New Reminder',
          style: TextStyle(color: Color(0xff297687)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff297687),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(label: const Text('Reminder name')),
              ),
              SizedBox(
                height: _app.appVerticalPadding(2.0),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: const Text('Date'),
                    suffixIcon: Icon(Icons.date_range)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(2.0),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: const Text('Time'),
                    suffixIcon: Icon(Icons.watch_later)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(2.5),
              ),
              const Text(
                'Select Category',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff959595)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(1.5),
              ),
              Container(
                height: _app.appHeight(4),
                width: _app.appWidth(20),
                child: const Center(
                    child: const Text(
                  'Events',
                  style: TextStyle(color: const Color(0xff297687)),
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff297687)),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(1.5),
              ),
              Container(
                height: _app.appHeight(4),
                width: _app.appWidth(20),
                child: const Center(
                    child: const Text(
                  'Invitation',
                  style: TextStyle(color: const Color(0xff297687)),
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff297687)),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(1.5),
              ),
              Container(
                height: _app.appHeight(4),
                width: _app.appWidth(20),
                child: const Center(
                    child: const Text(
                  'Personal',
                  style: TextStyle(color: const Color(0xff297687)),
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff297687)),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(1.5),
              ),
              Container(
                height: _app.appHeight(4),
                width: _app.appWidth(20),
                child: const Center(
                    child: const Text(
                  'Birthday',
                  style: TextStyle(color: const Color(0xff297687)),
                )),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff297687)),
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: _app.appVerticalPadding(25),
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    child: const Center(
                      child: const Text("Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: const [
                          Color(0xff205072),
                          Color(0xff2E8C92)
                        ]),
                        borderRadius: BorderRadius.circular(15)),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
