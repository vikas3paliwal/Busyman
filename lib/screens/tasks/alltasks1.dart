import 'package:busyman/models/task.dart';
import 'package:busyman/provider/taskprovider.dart';
import 'package:busyman/screens/tasks/alltaskstopwidget.dart';
import 'package:busyman/screens/tasks/taskfilters.dart';
import 'package:busyman/screens/tasks/taskwidget.dart';
import 'package:busyman/screens/tasks/taskwidget1.dart';
import 'package:busyman/services/sizeconfig.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late App _app;
  List<bool> tasks = [false];
  bool initial = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (initial) {
      setState(() {
        isLoading = true;
      });
      Future.delayed(Duration.zero).whenComplete(() async =>
          await Provider.of<TaskProvider>(context, listen: false)
              .fetchTasks()
              .whenComplete(() => setState(() {
                    isLoading = false;
                  })));
    }
    initial = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    _app = App(context);
    return Scaffold(
      body: Column(
        children: [
          TopView(),
          SizedBox(
            height: _app.appVerticalPadding(5.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Filters(
              callback: (val) {},
            ),
          ),
          SizedBox(
            height: _app.appVerticalPadding(2.5),
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                      itemCount: taskProvider.tasks.length,
                      itemBuilder: (ctx, i) {
                        return taskProvider.tasks
                            .map((e) => Column(
                                  children: [
                                    TaskWidget(
                                      task: e,
                                    ),
                                    SizedBox(
                                      height: _app.appVerticalPadding(1.0),
                                    )
                                  ],
                                ))
                            .toList()[i];
                      }),
                )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/AddTask');
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
