import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
            icon: Icons.edit,
            onTap: () {
              //editing logic
            }),
        IconSlideAction(
          icon: Icons.delete,
          onTap: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text(
                      'Are you sure you want to delete this?',
                      style: TextStyle(
                          color: Color(0xff2E2E2E),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            //deleting logic
                            Navigator.of(context).pop();
                          },
                          child: Text('Yes')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'))
                    ],
                  );
                });
          },
        ),
      ],
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        tileColor: const Color(0xffF3F3F3),
        dense: true,
        title: const Text(
          'Reminder Name Comes Here',
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: TextStyle(
              color: const Color(0xff297687),
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        subtitle: Row(
          children: const [
            Icon(
              Icons.watch_later_outlined,
              size: 12,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              '02:00pm',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Container(
          height: 30,
          width: 60,
          child: const Center(
              child: const Text(
            'Birthday',
            style: TextStyle(color: const Color(0xff858585), fontSize: 10),
          )),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff297687)),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
