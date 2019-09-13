import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdg_nashik/home/model/event.model.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel eventModel;

  EventItemWidget(this.eventModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            eventModel.icon,
            SizedBox(
              height: 16,
            ),
            Text(
              eventModel.text,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
