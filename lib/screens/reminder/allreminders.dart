import 'package:busyman/screens/reminder/reminderwidget.dart';
import 'package:busyman/services/sizeconfig.dart';
import 'package:flutter/material.dart';

class AllReminders extends StatefulWidget {
  const AllReminders({Key? key}) : super(key: key);

  @override
  _AllRemindersState createState() => _AllRemindersState();
}

class _AllRemindersState extends State<AllReminders>
    with TickerProviderStateMixin {
  late App _app;
  List<bool> tasks = [false];
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _app = App(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            clipBehavior: Clip.none,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const [Color(0xff205072), Color(0xff329D9C)])),
            width: MediaQuery.of(context).size.width,
            height: _app.appHeight(18),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: _app.appVerticalPadding(3.6),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: 'Work Log',
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          width: _app.appWidth(50),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    icon: Image.asset(
                                      'assets/icons/downarrow.png',
                                      height: 15,
                                      width: 15,
                                      color: Colors.white,
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                          child: Text('22 Oct 2021',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700)))
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Image(
                                      image: AssetImage(
                                          'assets/icons/reminder.png'),
                                      color: Colors.white,
                                    ))
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBar(
                      controller: _controller,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: const Color(0xff205072),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                      tabs: [
                        Tab(
                          child: Column(
                            children: const [
                              Text('Mon',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('20',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            children: const [
                              Text('Tue',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('21',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                        Tab(
                          height: 100,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Wed',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff205072),
                                    )),
                                Text('22',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff205072),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          child: Column(
                            children: const [
                              Text('Thu',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('23',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            children: const [
                              Text('Fri',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('24',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            children: const [
                              Text('Sat',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text('25',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ))
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
          SizedBox(
            height: _app.appVerticalPadding(3.5),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: _app.appVerticalPadding(3.5),
                  ),
                  const Text(
                    '4/10 done',
                    style: TextStyle(
                        color: Color(0xff297687),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: _app.appVerticalPadding(1.2),
                  ),
                  const ReminderWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ReminderWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ReminderWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ReminderWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/AddReminder');
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xff205072),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {},
        currentIndex: 1,
        showSelectedLabels: false,
        iconSize: 22,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.checklist_sharp,
                color: Color(0xffB7B7B7),
                size: 22,
              ),
              label: ''),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Color(0xffB7B7B7),
                size: 22,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/twitter.png'), label: ''),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Color(0xffB7B7B7),
                size: 22,
              ),
              label: ''),
        ],
      ),
    );
  }
}
